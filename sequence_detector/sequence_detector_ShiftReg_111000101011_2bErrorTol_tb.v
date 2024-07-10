`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector_tb.v
// Description: sequence_detector_ShiftReg_111000101011_2bErrorTol for 101001
// Designer: Barney Peng
// Date: 04/21/2024
//////////////////////////////////////////////////////////////////////

module sequence_detector_ShiftReg_111000101011_2bErrorTol_tb;

parameter WIDTH = 12; /* xx  bit counter*/


reg i_resetn;
reg i_data;
wire [WIDTH-1:0] o_pattern_match_XOR;


// restn
initial begin
    i_resetn = 0;
    #20   i_resetn = 1;
    #4000 i_resetn = 1;
    $finish;
end//restn

// input "i_data"
initial begin
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0; 
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0; 
    
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;  
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1; //111000101011

    @(posedge i_clk) i_data <= 1;

    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1; //111000101011



    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;//111000101011, 1 error bit

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;//111000101011, 1 error bit

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;//111000101011, 1 error bit

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0; //111000101011, 2 error bits

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0; //111000101011, 2 error bits
end// input "i_data"

// free running clock i_clk
reg i_clk = 0;
always #1 i_clk = !i_clk;



initial begin
    $monitor("At time %t, o_pattern_found = %h (%0d)", $time, o_pattern_found, o_pattern_found);
end



initial begin
    $dumpfile("sequence_detector_ShiftReg_111000101011_2bErrorTol.vcd");
    $dumpvars(0,sequence_detector_ShiftReg_111000101011_2bErrorTol_tb);
end

sequence_detector_ShiftReg_111000101011_2bErrorTol u_sequence_detector_ShiftReg_111000101011_2bErrorTol (
    .i_clk(i_clk),
    .i_resetn(i_resetn),
    .i_data(i_data),


    .o_pattern_found(o_pattern_found)


);


endmodule
