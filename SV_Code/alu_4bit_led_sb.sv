module alu_4bit_led_sb( 
 input logic [3:0] A,B,               
 input logic [2:0] ALU_Sel,
 output logic [3:0] ALU_Out);  
//
 alu_4bit u1(
  A,B, // ALU 4-bit Inputs                   
  ALU_Sel,  // ALU Selection 
  ALU_Out);  // ALU 4-bit Output 
 // );  // Carry Out Flag 
//
endmodule
