module mod10_counter(input logic clk,
    input logic reset, enable,
    output logic [3:0] count);   
 always @(posedge clk, posedge reset) begin
  if (reset) count <= 4'd0;
  else 
   if (enable)
     if (count == 4'd9) count <= 4'd0;
     else count <= count + 4'd1;
 end
endmodule
