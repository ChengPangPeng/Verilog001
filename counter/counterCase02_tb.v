`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: counterCase02_tb.v
// Description: Counter with clock gating and counter valid control
// Designer: Barney Peng
// Date: 03/18/2024
//////////////////////////////////////////////////////////////////////

module counterCase02_tb;
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

/* Make a reset that pulse once. */
reg resetn;
reg i_clk_en; //give initial values to the signals
reg i_count_valid; //give initial values to the signals
wire  o_count_end;
wire [7:0] o_count;

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
          i_clk_en = 0;
    #100  i_clk_en = 1; // gated the clock the counter after some delay
    #1500 i_clk_en = 0; // gated the clock the counter after some cycles
end

initial begin
         i_count_valid = 0;  
    #250 i_count_valid = 1; // valid the counter after some delay
    #100 i_count_valid = 0; // valid the counter after some delay
    #40  i_count_valid = 1; // valid the counter after some delay
    #200 i_count_valid = 0; // valid the counter after some delay
    #40  i_count_valid = 1; // valid the counter after some delay
    #80  i_count_valid = 0; // valid the counter after some delay
    #10  i_count_valid = 1; // valid the counter after some delay
    #400 i_count_valid = 0; // valid the counter after some delay
    #50  i_count_valid = 1; // valid the counter after some delay
    #800 i_count_valid = 0; // valid the counter after some delay
end

initial begin
    $dumpfile("counterCase02.vcd");
    $dumpvars(0,counterCase02_tb);
end

counterCase02 u_counterCase02 (
    .clk(clk),
    .resetn(resetn),
    .i_clk_en(i_clk_en),
    .i_count_valid(i_count_valid),
    .o_count_end(o_count_end),
    .o_count(o_count)
);

endmodule
