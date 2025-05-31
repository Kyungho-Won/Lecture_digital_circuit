// laser_timer_tb.v
`timescale 1 ns/10 ps // time-unit = 1 ns, precision = 10 ps 
module flight_call_button_tb;
 logic clock, reset, call, cncl, L;
 flight_call_button DUT (.clk(clock), .rst(reset), .call(call), .cncl(cncl), .L(L));
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
  call = 0; cncl = 0; #50;  call = 1; cncl = 0; #50;   call = 0; cncl = 0;  #100;  call = 1; cncl = 0; #50; call = 0; cncl = 1; # 50; 
end
endmodule