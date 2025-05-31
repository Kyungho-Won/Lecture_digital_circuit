`timescale 1ns / 1ps  

module add_sub_4bit_tb;
//Inputs
 logic [3:0] A,B;
 logic Sel;
 logic [4:0] C;

add_sub_4bit U1(.A(A), .B(B), .Sel(Sel), .C(C));  
initial begin
       A = 4'hA;
       B = 4'h2;
       Sel = 0;
#10;
       A = 4'hF;
       B = 4'h5;
       Sel = 1;
   end

endmodule