module soda_machine(
 input logic clk, rst, c,
 input logic [7:0] a, 
 output logic [7:0] tot,
 output logic d);
 logic [2:0] state, next_state;
 //logic [7:0] tot;
 parameter [7:0] s=8'd100;
 parameter [2:0] Init=0, Wait=1, Add=2, NotAdd=3, Disp=4;
 // register
 always_ff@(posedge clk, posedge rst) 
 begin
  if(rst)
   state <= Init;
  else
   state <= next_state;
 end
 // next state logic
 always_comb begin
  case(state)
   Init: next_state = Wait;
   Wait: begin
            if (c) next_state = Add;
            else 
             if (tot<s) next_state = Wait;
             else next_state = Disp;
           end
   Add: next_state = NotAdd;
   NotAdd: next_state = c ? NotAdd: Wait; 
   default: next_state = Init;
  endcase
 end
 // Output logic
 always_ff@(posedge clk) 
 begin
  case(state)
   Init: begin d = 0; tot = 0; end
   Add: tot = tot + a;
   Disp: d = 1;
  endcase
 end
endmodule

