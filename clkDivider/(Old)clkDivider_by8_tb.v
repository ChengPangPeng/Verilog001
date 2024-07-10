`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: clkDivider_by8_tb.v
// Description:  clk Divided by 8
// Designer: Barney Peng
// Date: 03/19/2024
//////////////////////////////////////////////////////////////////////

module clkDivider_by8_tb;


/* Make a reset that pulse once. */
reg resetn;
wire [2:0] o_clk_d8;
reg i_clk_en; //give initial values to the signals


initial begin
    resetn = 0;
    #20   resetn = 1;
    #4000 resetn = 1;
    $finish;
end

// free running clock clk
reg clk = 0;
always #1 clk = !clk;




initial begin
    $monitor("At time %t, clk_divided = %h (%0d)", $time, clk_divided, clk_divided);
end


initial begin
    i_clk_en = 0;
#100  i_clk_en = 1; // gated the clock the counter after some delay
#1500 i_clk_en = 0; // gated the clock the counter after some cycles
end


initial begin
    $dumpfile("clkDivider_by8.vcd");
    $dumpvars(0,clkDivider_by8_tb);
end

clkDivider_by8 u_clkDivider_by8 (
    .clk(clk),
    .resetn(resetn),
    .i_clk_en(i_clk_en),
    .clk_divided(clk_divided),
    .o_clk_d8(o_clk_d8),
    .o_clk_d8_end(o_clk_d8_end)
  //  .i_count_valid(i_count_valid),
  //  .o_count_end(o_count_end),
  //  .o_count(o_count)
);

endmodule
