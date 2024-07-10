//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector.v
// Description: sequence_detector_FSM_101001 for 101001
// Designer: Barney Peng
// Date: 03/31/2024
//////////////////////////////////////////////////////////////////////


module sequence_detector_FSM_101001 (
	input i_clk,
	input i_resetn,
	input i_data,



	output o_pattern_found



);

	parameter WIDTH = 6; /* 6  bit counter*/
	//parameter TGT_pattern = 6'b101001; 



	parameter S_initial = 6'd1,
			  S1 = 6'd2, //S1
			  S10 = 6'd3,	//S10
			  S101 = 6'd4,	//S101
			  S1010 = 6'd5, //S1010
			  S10100 = 6'd6; //S10100
			   
 	reg [WIDTH-1 : 0] cur_state, next_state; //current state and next state


	wire clk_gate;		// gated clock
	
	
	assign clk_gate = i_clk;


	// Sequence Detector: initial state is S_initial	
	always @(negedge i_resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~i_resetn)
				cur_state <= S_initial;		 // If reset is asserted, set the state to S_initial (initial State)
			else
				cur_state <= next_state;         // Else, set the state to the next state
		end// Sequence Detector: initial state is S_initial


	// Sequence Detector
	always @(cur_state or i_data)
	 begin
		case(cur_state)
			S_initial: begin
				if(i_data == 1'b1)
					next_state = S1;
				else
					 next_state = S_initial;
			end
			S1: begin
				if(i_data == 1'b1)
					next_state = S1;
				else
					 next_state = S10;			
			end
			S10: begin
				if(i_data == 1'b1)
					next_state = S101;
				else
					 next_state = S_initial;
			end
			S101: begin
				if(i_data == 1'b1)
					next_state = S1;
				else
					 next_state = S1010;
			end
			S1010: begin
				if(i_data == 1'b1)
					next_state = S101;
				else
					 next_state = S10100;
			end
			S10100: begin
				if(i_data == 1'b1)
					next_state = S1; // detected the pattern
				else
					 next_state = S_initial;
			end
			default: next_state = S_initial;
		endcase
	
	 end	
	
	


	assign o_pattern_found = (cur_state == S10100) && (i_data == 1)? 1:0;


endmodule // sequence_detector_FSM_101001 
