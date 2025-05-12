`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:51:25
// Design Name: 
// Module Name: count4_updown_tb
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


module count4_updown_tb;
 logic clock, reset, dir, tc;
 logic [3:0] count;
 count4_updown DUT (.clk(clock), .clr(reset), .mode(dir), .count(count), .tc(tc));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
//
always begin
  clock = 0; #5; 
  clock = 1; #10;
end
//
always begin
  dir = 0; #50; 
  dir = 1; #50;
  dir = 0; #200;
  dir = 1; #200;
end
endmodule
