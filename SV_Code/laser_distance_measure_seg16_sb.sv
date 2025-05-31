module laser_distance_measure_sb(
 input logic sys_clk, reset,
 input B, S,
 output logic [7:0] seg_out,
 output logic [3:0] seg_sel,
 output logic L);
//
logic clk;
logic [11:0] D;
logic [15:0] bcd;
//
clock_gen #(23) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
laser_distance_measure U2 (.clk(clk), .rst(reset),.B(B), .S(S), .D(D), .L(L));
segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(D), .seg_sel(seg_sel), .seg_out(seg_out));
//bin2bcd_p #(16) U4(D, bcd); 
//segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd), .seg_sel(seg_sel), .seg_out(seg_out));
//
endmodule

