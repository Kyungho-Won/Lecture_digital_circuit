`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps 
module count4_updown_tb;
 logic clock, reset, dir, tc;
 logic [3:0] count;
 count4_updown DUT (.clk(clock), .clr(reset), .mode(dir), .count(count), .tc(tc));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
initial begin
  clock = 0;  
  forever #5 clock = ~clock;
end
//
always begin
  dir = 0; #50; 
  dir = 1; #50;
  dir = 0; #200;
  dir = 1; #200;
end
endmodule
