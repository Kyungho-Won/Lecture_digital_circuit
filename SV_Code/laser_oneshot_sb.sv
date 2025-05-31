module laser_timer_sb(input logic sys_clk,
    input logic reset, b,
    output logic x);
logic clk;
clock_gen #(24) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
laser_oneshot DUT(.clk(clk), .rst(reset), .b(b), .x(x));
endmodule

