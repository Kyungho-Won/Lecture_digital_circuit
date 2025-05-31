module train_cross_fsm(
 input logic clk, reset, TRW, TRE, 
 output logic GATE, LIGHT);
 logic [3:0] state, next_state;
 parameter [3:0] s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7, s8=8;
//
// register
 always @ (posedge clk, posedge reset) 
 begin
  if(reset)
   state <= s0;
  else
   state <= next_state;
 end
 // next state logic
 always @ (*) begin
  case(state)
   s0: if(TRW==0 && TRE==0) next_state = s0;
       else if (TRW) next_state = s1;
       else next_state = s5;
   s1: if(TRE) next_state = s3; else next_state = s2;
   s2: if(TRE) next_state = s3; else next_state = s1;
   s3: if(TRE) next_state = s4; else next_state = s0;
   s4: if(TRE) next_state = s3; else next_state = s0;
   s5: if(TRW) next_state = s7; else next_state = s6;
   s6: if(TRW) next_state = s7; else next_state = s5;
   s7: if(TRW) next_state = s8; else next_state = s0;
   default: if(TRW) next_state = s7; else next_state = s0;
  endcase
 end
 // Output logic
 always @ (posedge clk) begin
 if (state==s0) LIGHT=1'b0; else LIGHT=~LIGHT;
 if (state==s0) GATE=1'b0; else GATE=1'b1;
 end
 //
endmodule