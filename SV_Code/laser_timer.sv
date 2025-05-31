module laser_timer(
 input logic clk, rst, b, 
 output logic x);
 logic [1:0] state, next_state;
 parameter [1:0] Off=0,On1=1,On2=2,On3=3;
 // register
 always_ff@(posedge clk, posedge rst) 
 begin
  if(rst)
   state <= Off;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   Off: next_state = b ? On1 : Off;
   On1: next_state = On2;
   On2: next_state = On3;
   default: next_state = Off;
  endcase
 end
 // Output logic
 always_comb begin
  case(state)
   Off: x = 1'b0;
   On1: x = 1'b1;
   On2: x = 1'b1;
   default: x = 1'b1;
  endcase
 end
endmodule

