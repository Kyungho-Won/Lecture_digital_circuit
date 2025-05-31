module seq_multiplier
#(parameter W=8) (
         input logic clk, reset,start, 
         input logic [W-1:0] Multiplicand, Multiplier, 
         output logic [2*W-1:0] Result, 
         output logic Done
             );
 logic [W-1:0] A, B, Q;
 logic C;
 logic [2:0] state, next_state;
 integer P;
 parameter [2:0] Init=0, Prep=1, AddN=2, Add=3, Shift=4, Finish=5;
 // register
 always_ff@(posedge clk, posedge reset) 
 begin
  if(reset)
   state <= Init;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   Init: next_state = Prep;
   Prep: next_state = start ? AddN: Prep;
   AddN: next_state = start ? AddN: Add;
   Add: next_state = Shift;
   Shift: next_state = (P==0) ? Finish: Add;
   Finish: next_state=Prep; 
  endcase
 end
 // Output logic
 always_ff@(posedge clk) 
 begin
  case(state)
   Init: begin Result=0; Done=0; end
   Prep: begin A=0; C=0; B=Multiplicand; Q=Multiplier; P=W; end
   AddN: begin Result=0; Done=0; end
   Add: begin P=P-1; 
            if (Q[0]==1) {C,A}=A+B;
          end
   Shift: {C,A,Q}={C,A,Q}>>1; 
   Finish: begin Result = {A,Q}; Done=1; end
  endcase
 end

endmodule
 
