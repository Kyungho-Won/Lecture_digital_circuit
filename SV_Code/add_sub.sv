module add_sub_4bit(
 input logic [3:0] A, B,                   
 input logic Sel,  
 output logic [4:0] C);  
 //
 always @(*) begin
  if (Sel) C=A-B;
  else C=A+B;
 end
endmodule
