`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module count4_enable_tb;
 logic clock, reset, enable, tc;
 logic [3:0] count;
 count4_enable DUT (.clk(clock), .clr(reset), .enable(enable), .count(count), .tc(tc));
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
  enable = 0; #50; 
  enable = 1; #200;
  enable = 0; #50;
  enable = 1; #200;
end
endmodule
