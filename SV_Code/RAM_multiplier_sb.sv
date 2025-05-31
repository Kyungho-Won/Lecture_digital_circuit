module RAM_multipler_sb(
 input logic sys_clk, reset,
 input logic CS, RW,
 input logic [3:0] A, B,
 input logic [7:0] Data,
 output logic [7:0] seg_out,
 output logic [3:0] seg_sel);
//
logic clk;
logic [7:0] Z, address;
logic [15:0] bcd;
//
assign address = {A, B};
clock_gen #(0) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
RAM_multiplier DUT (.clk(clk), .CS(CS), .RW(RW), .Address(address), .Data(Data), .Qout(Z));
bin2bcd_p #(8) U4(Z, bcd); 
segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd), .seg_sel(seg_sel), .seg_out(seg_out));
//
endmodule

