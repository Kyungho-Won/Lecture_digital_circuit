`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 12:02:02
// Design Name: 
// Module Name: mod10_counter_tb
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

module mod10_counter_tb;
 logic clock, reset, enable;
 logic [3:0] count;
 mod10_counter DUT (.clk(clock), .reset(reset), .enable(enable), .count(count));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
always begin
  clock = 0; #5; 
  clock = 1; #5;
end
//
always begin
  enable = 0; #50; 
  enable = 1; #200;
  enable = 0; #50;
  enable = 1; #200;
end
endmodule

