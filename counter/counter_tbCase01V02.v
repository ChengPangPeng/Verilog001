`timescale 1ns / 1ps //set the timescale for the module

module test;
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

/* Make a reset that pulse once. */

reg resetn;
reg enable; //give initial values to the signals
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
end

initial begin
    resetn = 0;
    #20 resetn = 1;
    //#110 resetn = 0; //remember that the total time for this reset=0 is 17+11=28

    #5130 $finish;
end

/* Make a regular pulsing clock. */
reg clk = 0;
always #1 clk = !clk;

wire [7:0] value;
counter u_counter (
    .o_count(value),
    .clk(clk),
    .resetn(resetn),
    .i_enable(enable)
);

initial begin
    $monitor("At time %t, value = %h (%0d)", $time, value, value);
    enable = 0;
    #200 enable = 1; // Enable the counter after some delay
    #1000 enable = 0; // Disable the counter after some cycles //remember that the total time for this enable=0 is 20+100=120
	#200 enable = 1; // Enable the counter after some delay
    #4000 enable = 0; // Disable the counter after some cycles
end

endmodule // test