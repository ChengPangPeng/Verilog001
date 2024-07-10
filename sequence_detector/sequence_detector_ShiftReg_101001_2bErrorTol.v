//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector.v
// Description: sequence_detector_ShiftReg_101001_2bErrorTol for 101001 (over-laping sequence detector)
// Designer: Barney Peng
// Date: 04/21/2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module sequence_detector_ShiftReg_101001_2bErrorTol (
	input i_clk,
	input i_resetn,
	input i_data,

	output o_pattern_found

);

	parameter WIDTH = 6; /* 6  bit counter*/
	//parameter TGT_pattern = 6'b101001; 

	parameter pattern = 6'b101001;

	reg [WIDTH-1 : 0] seq_reg; //sequence register
	reg [WIDTH-1 : 0] pattern_match_XOR;
	wire [WIDTH-1 : 0] Bit_sum;
	reg pattern_found_p;
	wire clk_gate;		// gated clock
	reg detect_en;

	reg [WIDTH-1 : 0] count_p;
	
	assign clk_gate = i_clk;


	// instantiate adder_6in_1b
	adder_6in_1b adder_inst (
        .i_a(pattern_match_XOR),
        .o_sum(Bit_sum)
    );// adder_6in_1b

	//sequence register
	always @(negedge i_resetn or posedge clk_gate)//sequential logic: use "<=" instead of "="
		begin
			if (~i_resetn)	
				begin
					seq_reg <= 6'h0;
					count_p <= 0;
					pattern_match_XOR[5:0] <= 6'h0;
				end
			else if(count_p >= 6'd63) // Max Value 6 bit can represent
				count_p <= WIDTH; //to prevent disbling detect_en after exceeding max value of count_p
			else
				begin
					seq_reg <= {seq_reg[WIDTH-2 : 0], i_data}; //shifter, shift seq_reg to the left by 1 bit, and put i_data to the right most bit
					count_p <= count_p + 1;
					pattern_match_XOR[5:0] <= (seq_reg ^ 6'b101001);
				end
		end //sequence register

		//detect_en
		always @(negedge i_resetn or posedge clk_gate)
		begin
			if (~i_resetn)
				detect_en <= 0;
			else if (count_p >= WIDTH)
				detect_en <= 1;
			else
				detect_en <= 0;
		end//detect_en



	 
	 /*always @* 
	 	begin
			Bit_sum = pattern_match_XOR[0] + pattern_match_XOR[1] + pattern_match_XOR[2] + pattern_match_XOR[3] + pattern_match_XOR[4] + pattern_match_XOR[5];

	end//Bit_sum//
*/





	//pattern_found_p
	always @(negedge i_resetn or posedge clk_gate) 
		begin
			if (~i_resetn)
			pattern_found_p <= 0;
			else if (detect_en && (Bit_sum <= 2))
			pattern_found_p <= 1;
			else
			pattern_found_p <= 0;
		end//pattern_found_p


	assign o_pattern_found = pattern_found_p;

	
endmodule //sequence_detector_ShiftReg_101001_2bErrorTol



module adder_6in_1b (

	input [WIDTH_in-1:0] i_a,

	output [WIDTH_out-1:0] o_sum

);
	parameter WIDTH_in = 6; 
	parameter WIDTH_out = 6;
	

	reg [WIDTH_out:0] sum_p;
	//reg [WIDTH_out:0] cout;
	//reg [WIDTH_in:0] cin;



always @(*)
begin
	sum_p = i_a[0] + i_a[1] + i_a[2] + i_a[3] + i_a[4] + i_a[5];



end

assign o_sum = sum_p;

endmodule//adder_6in_1b