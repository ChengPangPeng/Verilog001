//////////////////////////////////////////////////////////////////////
// Module Name: clkDivider_by7_counter.v
// Description: Clock Divider by 5 Counter
// Designer: Barney Peng
// Date: 03/24/2024
//////////////////////////////////////////////////////////////////////

//module counter #(parameter WIDTH (3) /* 3 bit counter*/)(
module clkDivider_by7_counter (
	input clk,
	input resetn,

	output o_count_end, 		      // counter reaches max value
	output wire [WIDTH-1 : 0] o_count,   // Output of the counter(remember that 8-bit: [7:0](7 to 0))


	output  o_tff_out_1,
	output  o_tff_out_2,
	output  o_div7_clk

);

	parameter WIDTH = 3; /* 3  bit counter*/

	reg tff_1_en_p;
	reg tff_2_en_p;

	reg [WIDTH-1 : 0] o_count_p;

	
	reg o_tff_1_out_p;
	reg o_tff_2_out_p;
	


	wire clk_gate;		// gated clock
	
	
	assign clk_gate = clk;
	// Counter
	always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
		 		o_count_p <= 2'h0;		 // If reset is asserted, set the counter to 0
			else if(o_count_p >= 3'd6)
				o_count_p <=  2'h0;      // Otherwise, deassign the output

			else 
				o_count_p <=  o_count_p + 1;         // Increment the counter by 1
		end//Counter

	//TFF_01_Enable
		always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
			tff_1_en_p <= 1'd0;		 // 
			else if(o_count_p == 2'h0)
			tff_1_en_p <=  1;         // (when counter value==0, i_tff_1_en_p = 1)
			else
			tff_1_en_p <=  1'd0;      // Otherwise, deassign the output
		end	//TFF_01_Enable


	//TFF_02_Enable
		always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
			tff_2_en_p <= 1'd0;		 // 
			else if(o_count_p == 3'd4)
			tff_2_en_p <=  1;         // (when counter value==2, i_tff_2_en_p = 1)
			else
			tff_2_en_p <=  1'd0;      // Otherwise, deassign the output
		end	//TFF_02_Enable

	//TFF_01_out
		always @ (negedge resetn or posedge clk_gate)
		begin
			if  (~resetn)
			o_tff_1_out_p <= 1'd0;		 // 
			else if(tff_1_en_p)
			o_tff_1_out_p <= ~o_tff_1_out_p;         // (when counter value==0, i_tff_1_en_p = 1)
			else
			o_tff_1_out_p = o_tff_1_out_p;
		end	//TFF_01_out

	//TFF_02_out
		always @ (negedge resetn or negedge clk_gate)
		begin
			if  (~resetn)
			o_tff_2_out_p <= 1'd0;		 // 
			else if(tff_2_en_p)
			o_tff_2_out_p <= ~o_tff_2_out_p;         // (when counter value==0, i_tff_1_en_p = 1)
			else
			o_tff_2_out_p = o_tff_2_out_p;
		end	//TFF_02_out


	assign o_count_end = (o_count == 3'd6);
	assign o_count = o_count_p;
	assign o_tff_out_1 = o_tff_1_out_p;
	assign o_tff_out_2 = o_tff_2_out_p;
	assign o_div7_clk = o_tff_1_out_p ^ o_tff_2_out_p; // ^ is XOR operator


endmodule // counter
