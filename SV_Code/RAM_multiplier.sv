module RAM_multiplier  (
 input logic clk, CS, RW, 
 input logic [7:0] Address,
 input logic [7:0] Data,
 output logic [7:0] Qout);

 logic [7:0] ram [0:255]; 

 always_ff @ (posedge clk) begin
  if (CS) begin
    if (RW) ram[Address] = Data;
    else Qout = ram[Address];
   end
 end
//
endmodule