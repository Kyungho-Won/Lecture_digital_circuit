module laser_distance_measure(
 input logic clk, rst,
 input B, S,
 output logic [15:0] D,
 output logic L);
 logic [15:0] Dctr;
 logic [2:0] state, next_state;
 parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4;
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
   S0: next_state = S1;
   S1: next_state = B ? S2: S1;
   S2: next_state = S3;
   S3: next_state = S ? S4: S3; 
   default: next_state = S1;
  endcase
 end
 // Output logic
 always_ff@(posedge clk) 
 begin
  case(state)
   S0: begin L = 1'b0; D = 16'b0; end
   S1: Dctr = 16'b0;
   S2: L = 1'b1;
   S3: begin L = 1'b0; Dctr = Dctr + 1; end
   S4: D = (Dctr>>1); // D = (Dctr / 2);
  endcase
 end
endmodule

