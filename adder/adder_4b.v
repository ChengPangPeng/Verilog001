    //////////////////////////////////////////////////////////////////////
    // Module Name: adder_4b.v
    // Description: 4-bit adder
    // Designer: Barney Peng
    // Date: 04/13/2024
    //////////////////////////////////////////////////////////////////////



    module adder_4b (

        input [WIDTH-1:0] i_a,
        input [WIDTH-1:0] i_b,
        output [WIDTH:0] o_sum
    
    );
        parameter WIDTH = 4; 
        
        reg [WIDTH:0] sum_p;
        reg [WIDTH-1:0] cout;
        reg [WIDTH-1:0] cin;
  

    //

    /*
    always @(*) begin
        sum_p = i_a^i_b^cin;
        cout = (i_a&i_b)|(i_b&cin)|(i_a&cin);
        cin = cout;
    end*/


    always @(*)
        begin
    // [0] //Half Adder for the first bit (bit [0])
            sum_p[0] = i_a[0]^i_b[0];
            cout[0] = (i_a[0]&i_b[0]);
    // [1] //Full Adder for the rest of the bits (bit [1] to bit [3])
            sum_p[1] = i_a[1]^i_b[1]^cout[0];        // sum_p = ((~i_a)*(~i_b)*cout)+((~i_a)*i_b*(~cout))+(i_a*(~i_b)*(~cout))+(i_a*(i_b)*(cout))
            cout[1] = (i_a[1]&i_b[1])|(i_b[1]&cout[0])|(i_a[1]&cout[0]); // cout = (i_a)(i_b)+(i_a)(cout)+(i_b)(cout)
    // [2]
            sum_p[2] = i_a[2]^i_b[2]^cout[1];
            cout[2] = (i_a[2]&i_b[2])|(i_b[2]&cout[1])|(i_a[2]&cout[1]);
    // [3]
            sum_p[3] = i_a[3]^i_b[3]^cout[2];
            cout[3] = (i_a[3]&i_b[3])|(i_b[3]&cout[2])|(i_a[3]&cout[2]);
    // [4]  
            sum_p[4] = cout[3];
        end


    assign o_sum = sum_p;

    endmodule//adder_4b