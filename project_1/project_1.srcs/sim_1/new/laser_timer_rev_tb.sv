`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 13:00:05
// Design Name: 
// Module Name: laser_timer_rev_tb
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


module laser_timer_rev_tb;
 logic clock, reset, b, x;
 laser_timer_rev DUT (.clk(clock), .rst(reset), .b(b), .x(x));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
//
always begin
  clock = 0; #5;   clock = 1; #5;
end
//
always begin
  b = 0; #100;  b = 1; #100;   b = 0; #50;  b = 1; #150;
end
endmodule
