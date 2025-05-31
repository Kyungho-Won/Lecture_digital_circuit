module flight_call_button_sb(input logic sys_clk,
    input logic reset, call, cncl,
    output logic L);
logic clk;
clock_gen U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
flight_call_button U2(.clk(clk), .rst(reset), .call(call), .cncl(cncl), .L(L));
endmodule