//////////////////////////////////////////////////////////////////////
// Module Name: counterCase02.v
// Description: Counter with clock gating and counter valid control
// Designer: Barney Peng
// Date: 03/19/2024
//////////////////////////////////////////////////////////////////////

//module counter #(parameter WIDTH (8) /* 8 bit counter*/)(
module clkDivider_by7_counter (
  input clk,
  input resetn,
  input i_clk_en,           // Clock and reset and enable inputs
  input i_count_valid,
  output o_count_end, 		      // counter reaches max value
  output wire [WIDTH-1 : 0] o_count,   // Output of the counter(remember that 8-bit: [7:0](7 to 0))
  //output reg div2_clk,
  //output reg div4_clk,
  output reg div7_clk
 

);

	parameter WIDTH = 3; /* 8 bit counter*/

	reg [WIDTH-1 : 0] o_count_p;
	wire clk_gate;		// gated clock
	
	assign clk_gate = clk & i_clk_en;

	always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
		 		o_count_p <= 3'h0;		 // If reset is asserted, set the counter to 0
			else if(i_count_valid &&	o_count_p < 3'd6)
				o_count_p <=  o_count_p + 1;         // Increment the counter by 1
			else if (o_count_p >= 3'd6)
				o_count_p <=  3'h0;      // Otherwise, deassign the output
			else
				o_count_p <=  o_count_p;      // Otherwise, deassign the output
		end


	assign o_count_end = (o_count == 3'd6);
	assign o_count = o_count_p;

		always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
				div7_clk <= 3'h0;		 // If reset is asserted, set the counter to 0
			else if(o_count_end)
				div7_clk <=  ~div7_clk;         // Increment the counter by 1
			
			else
				div7_clk <=  div7_clk;      // Otherwise, deassign the output
		end





endmodule // counter
