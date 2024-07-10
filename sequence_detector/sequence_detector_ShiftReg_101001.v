//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector.v
// Description: sequence_detector_ShiftReg_101001 for 101001 (over-laping sequence detector)
// Designer: Barney Peng
// Date: 03/31/2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module sequence_detector_ShiftReg_101001 (
	input i_clk,
	input i_resetn,
	input i_data,


	output o_pattern_found



);

	parameter WIDTH = 6; /* 6  bit counter*/
	//parameter TGT_pattern = 6'b101001; 



	reg [WIDTH-1 : 0] seq_reg; //sequence register


	wire clk_gate;		// gated clock
	
	
	assign clk_gate = i_clk;


	
	always @(negedge i_resetn or posedge clk_gate)
		begin
			if (~i_resetn)
			seq_reg <= 6'h0;
			else
			seq_reg <= {seq_reg[WIDTH-2 : 0], i_data};

		end


	assign o_pattern_found = (seq_reg ^ 6'b101001) == 0; // "^" is "XOR" operator 
	//this "XOR" method is better than direct comparison, since it is easier with non-zero bit tolerance.



endmodule //sequence_detector_ShiftReg_101001
