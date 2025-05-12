`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:26:24
// Design Name: 
// Module Name: mux4_21_tb
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

module mux4_21_tb();
 logic [3:0] a, b, y;
 logic sel;
localparam period = 20;
 mux4_21 DUT (.d0(a), .d1(b), .s(sel), .y(y));
initial begin // initial block executes only once
 // values for a, b and sel
  a = 0; b = 1; sel = 0; #period; // wait for period
  a = 2; b = 3; sel = 1; #period;
  a = 4; b = 5; sel = 0; #period;
  a = 6; b = 7; sel = 1; #period; $finish;
 end
initial // monitor response (print)
 $monitor ($time, "a = %d  b = %d  sel = %b  y = %4b", a, b, sel, y);
endmodule

