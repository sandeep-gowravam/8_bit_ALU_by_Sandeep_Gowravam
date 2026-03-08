module alu_8bit(
    input [7:0] A, B,        
    input [3:0] ALU_Sel,      
    output [7:0] ALU_Out,     
    output CarryOut         
);
    reg [7:0] ALU_Result;
    assign ALU_Out = ALU_Result;
    always @(*) begin
        case(ALU_Sel)
            4'b0000: ALU_Result = A + B;        // Addition
            4'b0001: ALU_Result = A - B;        // Subtraction
            4'b0010: ALU_Result = A * B;        // Multiplication
            4'b0011: ALU_Result = A / B;        // Division
            4'b0100: ALU_Result = A << 1;       // Logical shift left
            4'b0101: ALU_Result = A >> 1;       // Logical shift right
            4'b0110: ALU_Result = {A[6:0],A[7]}; // Rotate left
            4'b0111: ALU_Result = {A[0],A[7:1]}; // Rotate right
            4'b1000: ALU_Result = A & B;        // Bitwise AND
            4'b1001: ALU_Result = A | B;        // Bitwise OR
            4'b1010: ALU_Result = A ^ B;        // Bitwise XOR
            4'b1011: ALU_Result = ~(A | B);     // Bitwise NOR
            4'b1100: ALU_Result = ~(A & B);     // Bitwise NAND
            4'b1101: ALU_Result = ~(A ^ B);     // Bitwise XNOR
            4'b1110: ALU_Result = (A > B) ? 8'd1 : 8'd0; // Greater comparison
            4'b1111: ALU_Result = (A == B) ? 8'd1 : 8'd0; // Equality comparison
            default: ALU_Result = A + B;
        endcase
    end
endmodule
