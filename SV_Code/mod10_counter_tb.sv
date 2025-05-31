`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module mod10_counter_tb;
 logic clock, reset, enable;
 logic [3:0] count;
 mod10_counter DUT (.clk(clock), .reset(reset), .enable(enable), .count(count));
 //
initial begin
  reset = 1;   #20 reset = 0; 
end
always begin
  clock = 0; #5;  
  clock = 1; #10;
end
//
always begin
  enable = 0; #50; 
  enable = 1; #200;
  enable = 0; #50;
  enable = 1; #200;
end
endmodule
