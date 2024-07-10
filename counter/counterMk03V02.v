module counter(out, clk, reset, enable);

//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

	parameter WIDTH = 8; // 8 bit counter

	output [WIDTH-1 : 0] out;   // Output of the counter (remember that 8-bit: [7:0](7 to 0))
	input clk, reset, enable, counter_valid;           // (Clock, reset, enable, counter_valid) inputs

	reg [WIDTH-1 : 0] out;      // Register to store the count value
	wire clk, reset, enable, counter_valid;            // (Clock, reset, enable, counter_valid) signals

	always @(posedge clk)       // At every positive edge of the clock
    if (enable)
		out <= out + 1;         // Increment the counter by 1

	always @reset               // Process for handling reset
		if(reset)
			assign out = 0;     // If reset is asserted, set the counter to 0
		else
			deassign out;      // Otherwise, deassign the output

endmodule // counter