//////////////////////////////////////////////////////////////////////
// Module Name: 
// Description: 
// Designer: Barney Peng
// Date: 2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module D_FF_tb;

	reg i_clk;	
	reg i_clear;
	reg i_data;
	
	wire o_q;



										// Declare clock signal and initialize to 0
always #5 i_clk = !i_clk;                 // Toggle clock every 5 time uni, period = 10t



// Test scenario
initial begin
    // Initialize inputs
    i_clk = 0;
    i_clear = 0;
    i_data = 0;
    
    // Apply test values
    #15 i_data = 1;   // Set D to 1
    #15 i_data = 0;   // Set D to 0
    #15 i_clear = 1; // Set clear high
    #5 i_clear = 0; // Clear signal deasserted
    #20 $finish; // Finish simulation
end



always @(posedge i_clk) begin
    $display("Time=%0t clk=%b clear=%b d=%b q=%b", $time, i_clk, i_clear, i_data, o_q);
end


D_FF u_D_FF(
	.i_clk(i_clk),
	.i_clear(i_clear),
	.i_data(i_data),
	.o_q(o_q)

);



endmodule//