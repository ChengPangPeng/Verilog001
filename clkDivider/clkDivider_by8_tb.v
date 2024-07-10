`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: clkDivider_tb.v
// Description: clk Divided by 2
// Designer: Barney Peng
// Date: 03/19/2024
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
    $monitor("At time %t, div2_clk = %h (%0d)", $time, div2_clk, div2_clk);
    $monitor("At time %t, div4_clk = %h (%0d)", $time, div4_clk, div4_clk);
    $monitor("At time %t, div8_clk = %h (%0d)", $time, div8_clk, div8_clk);
end


initial begin
    $dumpfile("clkDivider_by8.vcd");
    $dumpvars(0,clkDivider_tb);
end

clkDivider u_clkDivider (
    .clk(clk),
    .resetn(resetn),
    .div2_clk(div2_clk),
    .div4_clk(div4_clk),
    .div8_clk(div8_clk)

    //. inmodule(inTB)
);

endmodule
