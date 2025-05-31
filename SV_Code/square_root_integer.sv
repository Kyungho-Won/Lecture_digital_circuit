module square_root_integer(
         input logic clk, reset, start, 
         input logic [7:0] A, 
         output logic [7:0] Result, 
         output logic Done
             );
 logic [8:0] square;
 logic [7:0] delta;
 logic [2:0] state, next_state;
 parameter [2:0] Init=0, Prep=1, Wait=2, Test=3, Update=4, Finish=5;
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
   Init: next_state=Prep;
   Prep: next_state=(start) ? Wait: Prep;
   Wait: next_state=(start) ? Wait: Test;
   Test: next_state=(square<=A) ? Update: Finish;
   Update: next_state=Test; 
   Finish: next_state=Prep; 
  endcase
 end
 // Output logic
 always_ff@(posedge clk) 
 begin
  case(state)
   Init: begin Result=0; Done=0; end
   Prep: begin square=1; delta=3; end
   Update: begin square=square + delta; delta=delta + 2; end
   Finish: begin Result=(delta>>1)-1; Done=1; end
  endcase
 end

endmodule
 
