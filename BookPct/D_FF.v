//////////////////////////////////////////////////////////////////////
// Module Name: 
// Description: 
// Designer: Barney Peng
// Date: 2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module D_FF (
	input i_clk,
	input i_clear,
	input i_data,
	
	output o_q

);
reg q;

always @(posedge i_clk or posedge i_clear) 
	begin
		if (i_clear) begin
			q <= 1'b0;
		end else begin
			q <= i_data;
		end
	end

assign o_q = q;

endmodule//