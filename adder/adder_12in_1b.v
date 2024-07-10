    //////////////////////////////////////////////////////////////////////
    // Module Name: adder_12in_1b.v
    // Description: 4-bit adder
    // Designer: Barney Peng
    // Date: 04/13/2024
    //////////////////////////////////////////////////////////////////////



    module adder_12in_1b (

        input [WIDTH_in-1:0] i_a,

        output [WIDTH_out:0] o_sum
    
    );
        parameter WIDTH_in = 12; 
        parameter WIDTH_out = 4;
        

        reg [WIDTH_out:0] sum_p;
        //reg [WIDTH_out:0] cout;
        //reg [WIDTH_in:0] cin;
  


always @(*)
    begin
        sum_p = i_a[0] + i_a[1] + i_a[2] + i_a[3] + i_a[4] + i_a[5] + i_a[6] + i_a[7] + i_a[8] + i_a[9] + i_a[10] + i_a[11];



    end

    assign o_sum = sum_p;

    endmodule//adder_12in_1b