`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:32:30
// Design Name: 
// Module Name: count4
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


module count4(input logic clk, clr, output logic [3:0] count);
 always_ff @(posedge clk, posedge clr) begin
   if (clr==1) 
    count <= 0;
   else 
    count <= count + 1;
 end
endmodule

