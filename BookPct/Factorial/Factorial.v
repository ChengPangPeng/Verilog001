//////////////////////////////////////////////////////////////////////
// Module Name: 
// Description: 
// Designer: Barney Peng
// Date: 2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module Factorial_Top;

	function automatic integer factorial(
		input integer i_data
		);
		begin
			if (i_data == 0) begin
				factorial = 1;
			end else begin
				factorial = i_data * factorial(i_data - 1);
			end
		end
	endfunction

	reg [31:0] result; // Changed to 'reg' with a specific bit width
	initial 
	begin
		result = factorial(10);
		$display("Factorial of 10 is %d", result);
	end

	// Declare o_result as a reg since we're assigning it in an always block
	reg [31:0] o_result;
	always @(*) begin
		o_result = result;
	end



	
	initial begin
		$dumpfile("Factorial.vcd");
		$dumpvars(0,Factorial);
	end

endmodule