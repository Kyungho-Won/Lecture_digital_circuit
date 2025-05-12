`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:32:59
// Design Name: 
// Module Name: count4_tb
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


module count4_tb;
 logic clock, reset;
 logic [3:0] count;
 count4 DUT (.clk(clock), .clr(reset), .count(count));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
//
initial begin
  clock = 0;  // must initialize clock 0
  forever #5 clock = ~clock;
end
endmodule
