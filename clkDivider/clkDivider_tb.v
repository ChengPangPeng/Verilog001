`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: clkDivider_tb.v
// Description: clk Divided by 2
// Designer: Barney Peng
// Date: 03/18/2024
//////////////////////////////////////////////////////////////////////

module clkDivider_tb;
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

/* Make a reset that pulse once. */
reg resetn;


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
    $dumpfile("clkDivider.vcd");
    $dumpvars(0,clkDivider_tb);
end

clkDivider u_clkDivider (
    .clk(clk),
    .resetn(resetn),
    .i_clk_en(i_clk_en),
    .clk_divided(clk_divided)
  //  .i_count_valid(i_count_valid),
  //  .o_count_end(o_count_end),
  //  .o_count(o_count)
);

endmodule
