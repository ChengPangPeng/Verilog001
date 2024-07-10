//module counter #(parameter WIDTH (8) /* 8 bit counter*/)(
module counter (
	
	input clk,
	input resetn,
	input i_enable,           // Clock and reset and enable inputs
	output reg [WIDTH-1 : 0] o_count   // Output of the counter(remember that 8-bit: [7:0](7 to 0))

);
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

	parameter WIDTH = 8; /* 8 bit counter*/



	wire clk, resetn, i_enable;            // Wires for clock and reset and enable signals

	always @(negedge resetn or posedge clk)       // At every positive edge of the clock
	if  (~resetn)
		 o_count <= 8'h0;		 // If reset is asserted, set the counter to 0
	else if(i_enable)

		o_count <=  o_count + 1;         // Increment the counter by 1
	else
		o_count <=  o_count;      // Otherwise, deassign the output
	
endmodule // counter