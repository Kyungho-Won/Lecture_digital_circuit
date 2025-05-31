// half_adder_tb.sv
`timescale 1 ns/1 ns // time-unit = 1 ns, precision = 1 ns 
module full_adder_tb;
 logic a, b, cin;
 logic sum, carry;
// duration for each bit = 20 * timescale = 20 * 1 ns = 20ns
 localparam period = 20;
//
 full_adder DUT (.a(a), .b(b), .cin(cin), .sum(sum), .carry(carry));
 //
 initial begin // initial block executes only once
 // values for a and b
  a = 0; b = 0; cin = 0; #period; // wait for period
  a = 0; b = 0; cin = 1; #period;
  a = 0; b = 1; cin = 0; #period;
  a = 0; b = 1; cin = 1; #period;
  a = 1; b = 0; cin = 0; #period; 
  a = 1; b = 0; cin = 1; #period;
  a = 1; b = 1; cin = 0; #period;
  a = 1; b = 1; cin = 1; #period;
 end
endmodule