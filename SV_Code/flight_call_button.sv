module flight_call_button(
 input logic clk, rst, call, cncl, 
 output logic L);
 logic state, next_state;
 parameter LightOff=0, LightOn=1;
 // register
 always_ff@(posedge clk, posedge rst) 
 begin
  if(rst)
   state <= LightOff;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   LightOff: next_state = call ? LightOn : LightOff;
   LightOn: next_state = (cncl & ~call) ? LightOff : LightOn;
  endcase
 end
 // Output logic
 always_comb begin
  case(state)
   LightOff: L = 1'b0;
   LightOn: L = 1'b1;
  endcase
 end
endmodule