module laser_oneshot(
 input logic clk, rst, b, 
 output logic x);
 logic [1:0] state, next_state;
 parameter [1:0] S0=0,S1=1,S2=2,S3=3;
 // register
 always_ff@(posedge clk, posedge rst) 
 begin
  if(rst)
   state <= S0;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   S0: next_state = b ? S1 : S0;
   S1: next_state = b ? S1 : S2;
   S2: next_state = S3;
   default: next_state = S0;
  endcase
 end
 // Output logic
 always_comb begin
  case(state)
   S0: x = 0;
   S1: x = 0;
   S2: x = 0;
   default: x = 1;
  endcase
 end
endmodule

