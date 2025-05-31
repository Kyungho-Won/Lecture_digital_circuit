module add_sub_seg_sb( 
 input sys_clk, reset,          
 input logic [3:0] A,B,               
 input logic Sel,
 output logic [3:0] seg_sel,
 output logic [7:0] seg_out); 
//
logic [4:0] C;
logic [15:0] bcd;
//
add_sub_4bit DUT (.A(A), .B(B), .Sel(Sel), .C(C));
bin2bcd_p #(8) U2(C, bcd); 
segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd), .seg_sel(seg_sel), .seg_out(seg_out));
//
endmodule
