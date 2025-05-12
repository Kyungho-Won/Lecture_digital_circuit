`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 11:04:27
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;
 logic a, b, cin;
 logic sum, carry;
// duration for each bit = 20 * timescale = 20 * 1 ns = 20ns
 localparam period = 20;
//
 case_fulladder DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(carry));
 //
 initial begin // initial block executes only once
 // values for a and b
 
    $display("time\ta\tb\tcin\tcout\tsum");
    $monitor("%g\t%b\t%b\t%b", $time, a, b, cin, carry, sum);
     
    a = 0; b = 0; cin=0; #period; // wait for period
    a = 0; b = 1; cin=0; #period;
    a = 1; b = 0; cin=1; #period;
    a = 1; b = 1; cin=1; #period;     $finish;

 end
endmodule

