// soda_machine_tb.v
`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module soda_machine_tb;
 logic clock, reset, c, d;
 logic [7:0] a, tot;
 soda_machine DUT (.clk(clock), .rst(reset), .c(c), .a(a), .tot(tot), .d(d));
//
initial begin
  reset=1; #20 reset=0; 
end
//
always begin
  clock=0; #5; clock=1; #5;
end
always begin
  c=0; #25;   c=1; #25;
end
//
always begin
  a=8'd0; #20; a=8'd25; #50;  a=8'd50; #50;  a=8'd25; #50; a=8'd25; #50; a=8'd50; #50;
end
endmodule
