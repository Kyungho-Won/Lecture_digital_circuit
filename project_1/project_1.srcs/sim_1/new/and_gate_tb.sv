`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 10:50:36
// Design Name: 
// Module Name: and_gate_tb
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

module and_gate_tb;
    logic a, b, y;

    and_gate uut(.a(a), .b(b), .y(y));

    initial begin
        $display("time\ta\tb\ty");
        $monitor("%g\t%b\t%b\t%b", $time, a, b, y);

        a = 0; b = 0;
        #10 a = 1;
        #10 b = 1;
        #10 a = 0;
        #10 $finish;
    end
endmodule
