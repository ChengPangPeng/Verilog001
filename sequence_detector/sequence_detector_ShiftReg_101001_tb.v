`timescale 1ns / 1ps //set the timescale for the module
//////////////////////////////////////////////////////////////////////
// Module Name: sequence detector_tb.v
// Description: sequence_detector_ShiftReg_101001 for 101001
// Designer: Barney Peng
// Date: 03/30/2024
//////////////////////////////////////////////////////////////////////

module sequence_detector_ShiftReg_101001_tb;

parameter WIDTH = 6; /* xx  bit counter*/


reg i_resetn;
reg i_data;



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
    @(posedge i_clk) i_data <= 1;  //101001 //but before the restn, thus not detected

    @(posedge i_clk) i_data <= 0;  
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;

    @(posedge i_clk) i_data <= 1;//101001
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1; //101001 


    @(posedge i_clk) i_data <= 0; //overlaping 
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1; //101001 

    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1; //101001 

    @(posedge i_clk) i_data <= 1; 
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;

    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1; //101001 


    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 0;
    @(posedge i_clk) i_data <= 1; //101001 




end// input "i_data"

// free running clock i_clk
reg i_clk = 0;
always #1 i_clk = !i_clk;



initial begin
    $monitor("At time %t, o_pattern_found = %h (%0d)", $time, o_pattern_found, o_pattern_found);
end



initial begin
    $dumpfile("sequence_detector_ShiftReg_101001.vcd");
    $dumpvars(0,sequence_detector_ShiftReg_101001_tb);
end

sequence_detector_ShiftReg_101001 u_sequence_detector_ShiftReg_101001 (
    .i_clk(i_clk),
    .i_resetn(i_resetn),
    .i_data(i_data),



    .o_pattern_found(o_pattern_found)


);

endmodule
