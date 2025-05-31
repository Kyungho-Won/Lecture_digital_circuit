module count4_enable(input logic clk, enable, clr, 
  output logic [3:0] count, output logic tc);
 always_ff @(posedge clk, posedge clr) begin
  if (clr==1) 
   count <= 0;
  else begin if (enable==1)  
    count <= count + 1;
   end
 end
 assign tc = (count==15) ? 1'b1: 1'b0; 
endmodule
