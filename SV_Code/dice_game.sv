module dice_game(
 input logic clk, reset,
 input logic ER, EL,
 output logic [2:0] A, B,
  output logic [3:0] SUM,
 output logic [2:0] D);
 logic [3:0] C;
 logic [2:0] state, next_state;
 parameter [2:0] S0=0, S1=1, S2=2, S3=3, S4=4;
 // register
 always @(posedge clk, posedge reset) 
 begin
  if(reset)
   state <= S0;
  else
   state <= next_state;
 end
 // next state logic
 always @(*) begin
  case(state)
   S0: if (ER==1 && EL==0) next_state=S1; else next_state=S0;
   S1: if (ER==1 && EL==0) next_state=S1; else next_state=S2;
   S2: if (ER==0 && EL==1) next_state=S3; else next_state=S2;
   S3: if (ER==0 && EL==1) next_state=S3; else next_state=S4;
   default: next_state=S4; 
  endcase
 end
  // Output logic
 always @(*) begin
  if (state==0) SUM=0;
  else SUM=A+B;
  if (SUM==0) D=3'b000;  
  else if (SUM<6) D=3'b100; 
   else  
    if (SUM>8) D=3'b001; 
    else D=3'b010; 
 end
 // Counter logic
 always @(posedge clk, posedge reset) 
 begin
  if (reset) C=0;
  else begin
   if (state==S1 || state==S3) begin
    if (C==6) C=1; 
    else C=C+1; end
   end  
 end
 always @(posedge clk) 
 begin
  if (state==S0) begin A=0; B=0; end
  else if (state==S2) A=C;
    else if (state==S4) B=C;
 end
endmodule

