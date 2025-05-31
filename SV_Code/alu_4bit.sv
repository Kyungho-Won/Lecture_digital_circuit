/* ALU Arithmetic and Logic Operations 
 Input     Operation
----------------------------------------------------------------
 000  |   ALU_Out = A + B;
 001  |   ALU_Out = A - B;
 010  |   ALU_Out = A +1;
 011  |   ALU_Out = A;
 100  |   ALU_Out = A and B ;
 101  |   ALU_Out = A or B;
 110  |   ALU_Out = A xor B;
 111  |   ALU_Out = not A; 
*/
 
module alu_4bit(
 input logic [3:0] A, B,  // ALU 4-bit Inputs                 
 input logic [2:0] ALU_Sel,  // ALU Selection
 output logic [3:0] ALU_Out);  // ALU 4-bit Output
 //
 always @ (*) begin
  case(ALU_Sel)
   3'b000: ALU_Out = A + B ; 
   3'b001: ALU_Out = A - B ;
   3'b010: ALU_Out = A + 1;
   3'b011: ALU_Out = A;
   3'b100: ALU_Out = A & B;
   3'b101: ALU_Out = A | B;
   3'b110: ALU_Out = A ^ B;
   default: ALU_Out = ~A;
  endcase
 end
endmodule
