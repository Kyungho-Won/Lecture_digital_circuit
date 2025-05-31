// half_adder_tb.sv
`timescale 1 ns/1 ns // time-unit = 1 ns, precision = 1 ns 
module half_adder_tb;
 logic a, b;
 logic sum, carry;
// duration for each bit = 20 * timescale = 20 * 1 ns = 20ns
 localparam period = 20;
//
 half_adder DUT (.a(a), .b(b), .sum(sum), .carry(carry));
 //
 initial begin // initial block executes only once
 // values for a and b
  a = 0; b = 0; #period; // wait for period
  a = 0; b = 1; #period;
  a = 1; b = 0; #period;
  a = 1; b = 1; #period;
 end
endmodule