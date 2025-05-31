module alu_4bit_seg_sb( 
 input sys_clk, reset,          
 input logic [3:0] A,B,               
 input logic [2:0] ALU_Sel,
 output logic [3:0] Segment_Sel,
 output logic [7:0] Segment_Out); 
//
logic [3:0] ALU_Out;
//
segment_4bit u1 (
  sys_clk, reset,
  ALU_Out,
  Segment_Sel,
  Segment_Out);
//
 alu_4bit u2(
  A, B, // ALU 4-bit Inputs                   
  ALU_Sel,  // ALU Selection 
  ALU_Out); // ALU 4-bit Output 
//
endmodule
