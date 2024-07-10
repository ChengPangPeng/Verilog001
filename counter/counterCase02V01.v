//module counter #(parameter WIDTH (8) /* 8 bit counter*/)(
module counter (
	
	input clk,
	input resetn,
	input count_en,           // Clock and reset and enable inputs
	input count_valid,
	output wire [WIDTH-1 : 0] o_count   // Output of the counter(remember that 8-bit: [7:0](7 to 0))

);
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

	parameter WIDTH = 8; /* 8 bit counter*/


	reg [WIDTH-1 : 0] o_count_p;

	always @(negedge resetn or posedge clk)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
		 		o_count_p <= 8'h0;		 // If reset is asserted, set the counter to 0
			else if(count_en && count_valid)

				o_count_p <=  o_count_p + 1;         // Increment the counter by 1
			else
				o_count_p <=  o_count_p;      // Otherwise, deassign the output
		end

	assign	o_count = o_count_p;

endmodule // counter