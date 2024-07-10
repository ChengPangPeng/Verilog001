//////////////////////////////////////////////////////////////////////
// Module Name: 
// Description: 
// Designer: Barney Peng
// Date: 2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

`timescale 1ns/1ps

module ALU_tb;

    parameter WIDTH = 4;
    reg [WIDTH-1:0] i_inA, i_inB;
    reg [2:0] i_s;
    wire [(WIDTH*2)-1:0] o_ALU;

    initial begin
        // Initialize inputs
        i_inA = 4'd15;
        i_inB = 4'd10;
        i_s = 3'b000;

        // Change inputs and monitor results
        #10 i_s = 3'b001;  // Test addition
        #10 i_s = 3'b010;  // Test subtraction
        #10 i_s = 3'b011;  // Test left shift
        #10 i_s = 3'b100;  // Test right shift
        #10 i_s = 3'b101;  // Test comparison
        #10 $finish;
    end

    initial begin
        $dumpfile("ALU.vcd");
        $dumpvars(0, ALU_tb);
    end

    initial begin
        $monitor("Time=%0t i_inA=%d, i_inB=%d, i_s=%b, o_ALU=%d", $time, i_inA, i_inB, i_s, o_ALU);
    end

    // Instantiate the ALU module
    ALU #(WIDTH) u_ALU (
        .i_inA(i_inA),
        .i_inB(i_inB),
        .i_s(i_s),
        .o_ALU(o_ALU)
    );

endmodule