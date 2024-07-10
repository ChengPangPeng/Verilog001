//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector.v
// Description: sequence_detector for 101001
// Designer: Barney Peng
// Date: 03/30/2024
//////////////////////////////////////////////////////////////////////

//module counter #(parameter WIDTH (3) /* 3 bit counter*/)(
module sequence_detector (
	input i_clk,
	input i_resetn,
	input i_data,

	output o_count_end, 		      // counter reaches max value
	output wire [WIDTH-1 : 0] o_count,   // Output of the counter(remember that 8-bit: [7:0](7 to 0))
	output o_pattern_found



);

	parameter WIDTH = 6; /* 6  bit counter*/
	//parameter TGT_pattern = 6'b101001; 

	reg [WIDTH-1 : 0] o_count_p;

	parameter A = 6'd1,
			  B = 6'd2, //S1
			  C = 6'd3,	//S10
			  D = 6'd4,	//S101
			  E = 6'd5, //S1010
			  F = 6'd6; //S10100
			   
 	reg [WIDTH-1 : 0] cur_state, next_state; //current state and next state


	wire clk_gate;		// gated clock
	
	
	assign clk_gate = i_clk;
	// Counter
	always @(negedge i_resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~i_resetn)
		 		o_count_p <= 2'h0;		 // If reset is asserted, set the counter to 0
			else if(o_count_p >= 6'd63)
				o_count_p <=  2'h0;      // Otherwise, deassign the output

			else 
				o_count_p <=  o_count_p + 1;         // Increment the counter by 1
		end//Counter

	// Sequence Detector: initial state is A	
	always @(negedge i_resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~i_resetn)
				cur_state <= A;		 // If reset is asserted, set the state to A (initial State)
			else
				cur_state <= next_state;         // Else, set the state to the next state
		end// Sequence Detector: initial state is A


	// Sequence Detector
	always @(cur_state or i_data)
	 begin
		case(cur_state)
			A: begin
				if(i_data == 1'b1)
					next_state = B;
				else
					 next_state = A;
			end
			B: begin
				if(i_data == 1'b1)
					next_state = B;
				else
					 next_state = C;			
			end
			C: begin
				if(i_data == 1'b1)
					next_state = D;
				else
					 next_state = A;
			end
			D: begin
				if(i_data == 1'b1)
					next_state = B;
				else
					 next_state = E;
			end
			E: begin
				if(i_data == 1'b1)
					next_state = B;
				else
					 next_state = F;
			end
			F: begin
				if(i_data == 1'b1)
					next_state = B; // detected the pattern
				else
					 next_state = A;
			end
			default: next_state = A;
		endcase
	
	 end	
	
	
	assign o_count_end = (o_count == 6'd63);
	assign o_count = o_count_p;
	assign o_pattern_found = (cur_state == F) && (i_data == 1)? 1:0;


endmodule // counter
