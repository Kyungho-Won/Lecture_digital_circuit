module train_cross_fsm(
 input logic clk, reset, TRW, TRE, 
 output logic GATE, LIGHT);
 logic [1:0] state, next_state;
 parameter [1:0] s0=0, s1=1, s2=2, s3=3;
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
   s0: if ((TRW==0 && TRE==1) || (TRW==1 && TRE==0)) next_state=s1; else next_state=s0;
   s1: if ((TRW==0 && TRE==1) || (TRW==1 && TRE==0)) next_state=s1; else next_state=s2;
   s2: if ((TRW==0 && TRE==1) || (TRW==1 && TRE==0)) next_state=s3; else next_state=s2;
   default: if (TRW==0 && TRE==0) next_state=s0; else next_state=s3;   
  endcase
 end
 // Output logic
 always @ (posedge clk) begin
 if (state==s0) LIGHT=1'b0; else LIGHT=~LIGHT;
 if (state==s0) GATE=1'b0; else GATE=1'b1;
 end
 //
endmodule