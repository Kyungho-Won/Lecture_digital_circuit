`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:52:27
// Design Name: 
// Module Name: count4_updown
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module count4_updown(input logic clk, clr, mode, 
  output logic [3:0] count, output logic tc);
 always_ff @(posedge clk) begin
  if (clr==1)count <= 0;
  else begin 
   if (mode==0)  
    count <= count + 1;
   else
    count <= count - 1;
  end
 end
//
 always_comb begin
  if (mode==0)
   if (count==15) tc = 1;
   else tc = 0;
  else 
   if(count==0) tc = 1;
   else tc = 0;
 end
endmodule

