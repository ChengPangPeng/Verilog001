`timescale 1ns / 1ps //set the timescale for the module

module test;
//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

/* Make a reset that pulse once. */

reg resetn;
reg count_en; //give initial values to the signals
reg count_valid; //give initial values to the signals
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);
end

initial begin
    resetn = 0;
    #20 resetn = 1;

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
    .count_en(count_en),
    .count_valid(count_valid)
);

initial begin
    $monitor("At time %t, value = %h (%0d)", $time, value, value);
    count_en = 0;
    count_valid = 0;  
    #200 count_en = 1; // Enable the counter after some delay
    #100 count_valid = 1; // Enable the counter after some delay

    #1000 count_en = 0; // Disable the counter after some cycles //remember that the total time for this enable=0 is 20+100=120   
	#200 count_en = 1; // Enable the counter after some delay 
    #100 count_valid = 0; // Enable the counter after some delay
    #100 count_valid = 1; // Enable the counter after some delay
    #4000 count_en = 0; // Disable the counter after some cycles
end

endmodule // test