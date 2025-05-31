module mod10_counter_sb(input logic sys_clk,
    input logic reset, enable,
    output logic [7:0] seg_out,
    output logic [3:0] seg_sel,
    output logic [3:0] count);
//
logic clk;
//
clock_gen U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
//
mod10_counter U2 (.clk(clk), .reset(reset), .enable(enable), .count(count));

segment_4bit U3 (.sys_clk(sys_clk), .reset(reset), .Segment_In(count), .Segment_Sel(seg_sel), .Segment_Out(seg_out));

//
endmodule
