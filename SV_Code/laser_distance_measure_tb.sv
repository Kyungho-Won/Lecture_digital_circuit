// soda_machine_tb.v
`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module laser_distance_measure_tb;
 logic clock, reset, B, S, L;
 logic [15:0] D;
//
 laser_distance_measure DUT (.clk(clock), .rst(reset), .B(B), .S(S), .D(D), .L(L));
//
initial begin
  reset=1; #20 reset=0; 
end
//
always begin
  clock=0; #5; clock=1; #5;
end
initial begin
  B=0; #50; B=1; #50; B=0;
end
//
always begin
  S=0; #800; S=1; #20; S=0; 
end
endmodule
