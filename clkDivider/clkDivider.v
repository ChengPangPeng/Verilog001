//module clkDivider 
module clkDivider (
	
	input clk,
	input resetn,
	input i_clk_en,           // Clock and reset and enable inputs
	
	output reg clk_divided
);

	always @(negedge resetn or posedge clk)	// At every positive edge of the clock
		begin
			if  (~resetn)
				clk_divided <= 1'b0;		 // 
			else
				clk_divided <= ~clk_divided;         //
		end


endmodule // counter