`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: clkDivider_by5_counter_tb.v
// Description: Clock Divider by 5 Counter
// Designer: Barney Peng
// Date: 03/24/2024
//////////////////////////////////////////////////////////////////////

module clkDivider_by5_counter_tb;


reg resetn;

parameter WIDTH = 3; /* 2  bit counter*/
wire  o_count_end;
wire [WIDTH-1:0] o_count;

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
    $monitor("At time %t, o_count = %h (%0d)", $time, o_count, o_count);
end



initial begin
    $monitor("At time %t, o_div5_clk = %h (%0d)", $time, o_div5_clk, o_div5_clk);
end

initial begin
    $dumpfile("clkDivider_by5_counter.vcd");
    $dumpvars(0,clkDivider_by5_counter_tb);
end

clkDivider_by5_counter u_clkDivider_by5_counter (
    .clk(clk),
    .resetn(resetn),

    .o_count_end(o_count_end),
    .o_count(o_count),

    .o_div5_clk(o_div5_clk)
);

endmodule
