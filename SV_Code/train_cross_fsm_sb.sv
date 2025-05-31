module train_cross_fsm_sb(
    input logic sys_clk, reset, TRW, TRE,
    output logic LIGHT, GATE);
//
logic clk;

clock_gen #(24) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
train_cross_fsm U2 (.clk(clk), .reset(reset), .TRW(TRW), .TRE(TRE), .LIGHT(LIGHT), .GATE(GATE));
//
endmodule

