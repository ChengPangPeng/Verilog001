//module clkDivider_by8 (divide clk by 8)
module clkDivider_by8 (
	
	input clk,
	input resetn,
	//input i_clk_en,           // Clock and reset and enable inputs
	//input i_count_valid,
	//output o_count_end, 		      // counter reaches max value
	//output wire [WIDTH-1 : 0] o_clk_d8, 
	//output o_clk_d8_end,
	//output wire [WIDTH-1 : 0] o_count,   // Output of the counter(remember that 8-bit: [7:0](7 to 0))
	output clk_divided

);

	parameter WIDTH = 3; /* 3 bit  */
	reg [WIDTH-1 : 0] o_clk_d8_p;
	reg  clk_divided_p;

	// reg [WIDTH-1 : 0] o_count_p;




	always @(negedge resetn or posedge clk)       // At every positive edge of the clock or negative edge of restn
		begin
			if  (~resetn)
		 		o_clk_d8_p <= 3'd0;		 // If reset is asserted, set the counter to 0
				   
			else  if(i_clk_en)
				o_clk_d8_p <=  o_clk_d8_p + 1;         // Increment the counter by 1
			else
				o_clk_d8_p <=  o_clk_d8_p;
		end

	assign o_clk_d8_end = (o_clk_d8 == 3'd7); //when o_clk_d8 reaches 7, o_clk_d8_end is high

	always @(negedge o_clk_d8_end)   
		begin
		//	if  (~o_clk_d8_end)
		clk_divided_p <= ~clk_divided_p;         //
		//o_clk_d8_p <=  3'd0;      
		end
	
	assign o_clk_d8 = o_clk_d8_p;
	assign clk_divided = clk_divided_p;


endmodule // clk