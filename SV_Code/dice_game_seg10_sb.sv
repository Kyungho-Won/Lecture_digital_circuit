module dice_game_seg10_sb(
 input logic sys_clk, reset,
 input logic ER, EL,
 output logic [2:0] A, B,
 output logic [7:0] seg_out,
 output logic [3:0] seg_sel,
 output logic [2:0] D);
//
//logic [11:0] bin;
logic [7:0] bcd34;
logic [3:0] SUM;
//
dice_game U1 (.clk(sys_clk), .reset(reset), .ER(ER), .EL(EL), .A(A), .B(B), .SUM(SUM), .D(D));
//bin2bcd_p #(4) U2(A, bcd1); 
//bin2bcd_p #(4) U3(B, bcd2);
bin2bcd_p #(8) U4(SUM, bcd34);
//assign bcd={bcd34, bcd2, bcd1};  
segment_16bit U5 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd34), .seg_sel(seg_sel), .seg_out(seg_out));

//
endmodule

