`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module count4_tb;
 logic clock, reset;
 logic [3:0] count;
 count4 DUT (.clk(clock), .clr(reset), .count(count));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
//
initial begin
  clock = 0;  // must initialize clock 0
  forever #5 clock = ~clock;
end
endmodule
