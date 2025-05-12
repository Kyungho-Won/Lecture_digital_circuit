`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 12:56:09
// Design Name: 
// Module Name: laser_timer_rev
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


module laser_timer_rev(
 input logic clk, rst, b, 
 output logic x);
 logic [2:0] state, next_state;
 parameter [2:0] Off=0,On1=1,On2=2,On3=3, Wait_state=4;
 // register
 always_ff@(posedge clk, posedge rst) 
 begin
  if(rst)
   state <= Off;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   Off: next_state = b ? On1 : Off;
   On1: next_state = On2;
   On2: next_state = On3;
   On3: next_state = Wait_state;
   Wait_state: next_state = b? Wait_state : Off;
  endcase
 end
 
 // Output logic
 always_comb begin
  case(state)
   On1: x = 1'b1;
   On2: x = 1'b1;
   On3: x = 1'b1;
   default: x = 1'b0; // Wait, Off
  endcase
 end
endmodule
