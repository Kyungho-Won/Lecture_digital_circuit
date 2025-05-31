module soda_machine_sge16_sb(
    input logic sys_clk, reset, c,
    input logic [7:0] a,
    output logic [7:0] seg_out,
    output logic [3:0] seg_sel, 
    output logic d);
//
logic clk;
logic [7:0] tot;
logic [15:0] bcd;
//
clock_gen #(24) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
soda_machine U2 (.clk(clk), .reset(reset), .c(c), .a(a), .tot(tot), .d(d));
segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(tot), .seg_sel(seg_sel), .seg_out(seg_out));
//bin2bcd_p #(8) U4(tot, bcd); 
//segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd), .seg_sel(seg_sel), .seg_out(seg_out)); 
//
endmodule

