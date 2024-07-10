//module clkDivider 
module clkDivider (
	
	input clk,
	input resetn,
	
	output reg div2_clk,
	output reg div4_clk,
	output reg div8_clk
);

	always @(negedge resetn or posedge clk)	// At every positive edge of the clock
		begin
			if  (~resetn)
				div2_clk <= 1'b0;		 // 
			else
				div2_clk <= ~div2_clk;         //
		end

	always @(negedge resetn or posedge div2_clk)	// At every positive edge of the clock
		begin
			if  (~resetn)
				div4_clk <= 1'b0;		 // 
			else
				div4_clk <= ~div4_clk;         //
		end

	always @(negedge resetn or posedge div4_clk )	// At every positive edge of the clock
		begin
			if  (~resetn)
				div8_clk <= 1'b0;		 // 
			else
				div8_clk <= ~div8_clk;         //
		end
		

endmodule // counter