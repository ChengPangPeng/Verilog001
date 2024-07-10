//////////////////////////////////////////////////////////////////////
// Module Name: 
// Description: 
// Designer: Barney Peng
// Date: 2024
// References: https://www.youtube.com/watch?v=T_gSYkQe3EU
//////////////////////////////////////////////////////////////////////
	

module ALU #(parameter WIDTH = 4) (
    input [WIDTH-1:0] i_inA, 
    input [WIDTH-1:0] i_inB, 
    input [2:0] i_s, 
    output [(WIDTH*2)-1:0] o_ALU
);

    // Function definition
    function [(WIDTH*2)-1:0] alu_operation;
        input [WIDTH-1:0] inA, inB;
        input [2:0] s;
        begin
            case (s)
                3'b000: alu_operation = inA;
                3'b001: alu_operation = inA + inB;
                3'b010: alu_operation = inA - inB;
                3'b011: alu_operation = inA << 1;
                3'b100: alu_operation = inA >> 1;
                3'b101: alu_operation = (inA > inB) ? 1 : 0;
                default: alu_operation = {WIDTH{1'b0}};
            endcase
        end
    endfunction

    // Using the function to assign the output
    assign o_ALU = alu_operation(i_inA, i_inB, i_s);

endmodule