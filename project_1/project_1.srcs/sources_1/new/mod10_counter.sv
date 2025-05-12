`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 12:01:19
// Design Name: 
// Module Name: mod10_counter
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


module mod10_counter(input logic clk,
    input logic reset, enable,
    output logic [3:0] count);
 always_ff @(posedge clk) begin
  if (reset) count <= 4'd0;
  else 
   if (enable)
     if (count == 4'd9) count <= 4'd0;
     else count <= count + 4'd1;
 end
endmodule

