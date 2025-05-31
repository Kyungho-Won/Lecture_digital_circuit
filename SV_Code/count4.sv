module count4(
input logic clk, clr, 
output logic [3:0] count);
//posedge or negedge
 always @(posedge clk, posedge clr) begin
   if (clr==1) 
    count <= 0;
   else 
    count <= count + 1;
 end
//
endmodule