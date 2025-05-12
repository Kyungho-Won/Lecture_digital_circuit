`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:24:11
// Design Name: 
// Module Name: mux4_21
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


module mux4_21(input  logic [3:0] d0, d1, 
            input  logic       s,
            output logic [3:0] y);
   assign y = s ? d1 : d0; 
endmodule

