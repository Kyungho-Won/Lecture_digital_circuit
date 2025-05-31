 `timescale 1ns / 1ps  

module alu_4bit_tb;
//Inputs
 logic [3:0] A,B;
 logic [2:0] ALU_Sel;

//Outputs
 logic [3:0] ALU_Out;
 //ogic CarryOut;
 // Verilog code for ALU
 integer i;
 alu_4bit test_unit(
            A,B,  // ALU 4-bit Inputs                 
            ALU_Sel,// ALU Selection
            ALU_Out); // ALU 4-bit Output
 
    initial begin
       A = 4'hA;
       B = 4'h2;
       ALU_Sel = 3'h0;
      for (i=0;i<=7;i=i+1) begin
       #10;
       ALU_Sel = ALU_Sel + 3'h1;
      end;
       #10;
       A = 4'h3;
       B = 4'hF;
       ALU_Sel = 3'h0;
      for (i=0;i<=7;i=i+1) begin
       #10;
       ALU_Sel = ALU_Sel + 3'h01;
      end;
   end
endmodule
