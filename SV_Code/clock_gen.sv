module clock_gen
#( parameter N = 24)
(input logic sys_clk, reset,
    output logic clk);
logic [31:0] tmp;
always_ff @ (posedge sys_clk, posedge reset) 
begin
  if (reset) tmp = 32'b0;
  else tmp = tmp + 1'b1;
end
assign clk = tmp[N];
endmodule