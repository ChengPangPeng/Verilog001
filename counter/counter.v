module counter(out, clk, reset);

	parameter WIDTH = 8; // 8 bit counter

	output [WIDTH-1 : 0] out;   // Output of the counter
	input clk, reset;           // Clock and reset inputs

	reg [WIDTH-1 : 0] out;      // Register to store the count value
	wire clk, reset;            // Wires for clock and reset signals

	always @(posedge clk)       // At every positive edge of the clock
		out <= out + 1;         // Increment the counter by 1

	always @reset               // Process for handling reset
		if(reset)
			assign out = 0;     // If reset is asserted, set the counter to 0
		else
			deassign out;      // Otherwise, deassign the output

endmodule // counter