//////////////////////////////////////////////////////////////////////
// Module Name: counterCase02.v
// Description: Counter with clock gating and counter valid control
// Designer: Barney Peng
// Date: 03/18/2024
//////////////////////////////////////////////////////////////////////

//module counter #(parameter WIDTH (8) /* 8 bit counter*/)(
module counterCase02 (
  input clk,
  input resetn,
  input i_clk_en,           // Clock and reset and enable inputs
  input i_count_valid,
  output o_count_end, 		      // counter reaches max value
  output wire [WIDTH-1 : 0] o_count   // Output of the counter(remember that 8-bit: [7:0](7 to 0))
);
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

	parameter WIDTH = 8; /* 8 bit counter*/

	reg [WIDTH-1 : 0] o_count_p;
	wire clk_gate;		// gated clock
	
	assign clk_gate = clk & i_clk_en;

	always @(negedge resetn or posedge clk_gate)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
		 		o_count_p <= 8'h0;		 // If reset is asserted, set the counter to 0
			else if(i_count_valid)
				o_count_p <=  o_count_p + 1;         // Increment the counter by 1
			else
				o_count_p <=  o_count_p;      // Otherwise, deassign the output
		end

	assign o_count_end = (o_count == 8'd255);
	assign o_count = o_count_p;


endmodule // counter
