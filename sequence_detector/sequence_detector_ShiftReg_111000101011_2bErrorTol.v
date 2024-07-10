//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector.v
// Description: sequence_detector_ShiftReg_111000101011_2bErrorTol for 101001 (over-laping sequence detector)
// Designer: Barney Peng
// Date: 04/21/2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module sequence_detector_ShiftReg_111000101011_2bErrorTol  (
	input i_clk,
	input i_resetn,
	input i_data,

	output o_pattern_found

);

	parameter WIDTH = 12; 
	//parameter TGT_pattern = 12'b111000101011; 
    //parameter ERROR_TOLERANCE = 2; // Maximum number of tolerated errors



	reg [WIDTH-1 : 0] seq_reg; //sequence register
	reg [WIDTH-1 : 0] pattern_match_XOR;
	wire [WIDTH-1 : 0] Bit_sum;
	reg pattern_found_p;
	wire clk_gate;		// gated clock
	reg detect_en;

	reg [WIDTH-1 : 0] count_p;

	assign clk_gate = i_clk;

	// instantiate adder_12in_1b
	adder_12in_1b adder_inst (
        .i_a(pattern_match_XOR),
        .o_sum(Bit_sum)
    );// adder_12in_1b

	//sequence register
	always @(negedge i_resetn or posedge clk_gate)//sequential logic: use "<=" instead of "="
		begin
			if (~i_resetn)	
				begin
					seq_reg <= 12'h0;
					count_p <= 0;
					pattern_match_XOR[11:0] <= 12'h0;
				end
			else if(count_p >= 12'd4095) // Max Value 12 bit can represent
				count_p <= WIDTH; //to prevent disbling detect_en after exceeding max value of count_p
			else
				begin
					seq_reg <= {seq_reg[WIDTH-2 : 0], i_data};
					count_p <= count_p + 1;
					pattern_match_XOR[11:0] <= (seq_reg ^ 12'b111000101011);
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

		//Bit_sum// Bit_sum is the sum of howm nmany error bits in the
	 
	/*always @* 
		begin
		   Bit_sum = pattern_match_XOR[0] + pattern_match_XOR[1] + pattern_match_XOR[2] + pattern_match_XOR[3] + pattern_match_XOR[4] + pattern_match_XOR[5] + pattern_match_XOR[6] + pattern_match_XOR[7] + pattern_match_XOR[8] + pattern_match_XOR[9] + pattern_match_XOR[10] + pattern_match_XOR[11];

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
	


endmodule //sequence_detector_ShiftReg_111000101011_2bErrorTol

module adder_12in_1b (

	input [WIDTH_in-1:0] i_a,

	output [WIDTH_out-1:0] o_sum

);
	parameter WIDTH_in = 12; 
	parameter WIDTH_out = 12;
	

	reg [WIDTH_out:0] sum_p;
	//reg [WIDTH_out:0] cout;
	//reg [WIDTH_in:0] cin;



always @(*)
begin
	sum_p = i_a[0] + i_a[1] + i_a[2] + i_a[3] + i_a[4] + i_a[5] + i_a[6] + i_a[7] + i_a[8] + i_a[9] + i_a[10] + i_a[11];

end

assign o_sum = sum_p;

endmodule//adder_12in_1b