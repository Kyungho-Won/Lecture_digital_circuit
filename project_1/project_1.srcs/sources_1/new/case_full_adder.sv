`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:09:23
// Design Name: 
// Module Name: case_full_adder
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


module case_fulladder(output logic sum, cout,
  input logic a, b, cin);
 logic [1:0] carry_sum; 
 always_comb begin
  case ({a, b, cin}) 
   3'b000: carry_sum = 2'b00;
   3'b001: carry_sum = 2'b01;
   3'b010: carry_sum = 2'b01;
   3'b011: carry_sum = 2'b10;
   3'b100: carry_sum = 2'b01;
   3'b101: carry_sum = 2'b10;
   3'b110: carry_sum = 2'b10;
   default: carry_sum = 2'b11; // required
  endcase
 end
 assign {cout, sum} = carry_sum; 
endmodule 
