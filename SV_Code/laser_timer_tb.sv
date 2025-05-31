// laser_timer_tb.v
`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module laser_timer_tb;
 logic clock, reset, b, x;
 laser_timer DUT (.clk(clock), .rst(reset), .b(b), .x(x));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
//
always begin
  clock = 0; #5;   clock = 1; #5;
end
//
always begin
  b = 0; #100;  b = 1; #100;   b = 0; #50;  b = 1; #150;
end
endmodule
