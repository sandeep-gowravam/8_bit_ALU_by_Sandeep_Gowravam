`timescale 1ns / 1ps
module tb_alu;
    reg [7:0] A, B;
    reg [3:0] ALU_Sel;
    wire [7:0] ALU_Out;
    alu_8bit uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out)
    );
    integer i;
    initial begin
        A = 8'h0A; //10
        B = 8'h07; // 7
        ALU_Sel = 4'h0;
        $monitor("Sel=%b | A=%d, B=%d | Result=%d", ALU_Sel, A, B, ALU_Out);
        for (i = 0; i <= 15; i = i + 1) begin
            ALU_Sel = i;
            #10;
        end
        $finish;
    end
endmodule
