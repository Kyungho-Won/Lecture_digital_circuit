module seq_multipler_sb #(parameter W=8)
(
 input logic sys_clk, reset,
 input logic start,
 input [W-1:0] X, Y,
 output logic [7:0] seg_out,
 output logic [3:0] seg_sel,
 output logic [3:0] led_out,
 output logic Done);
//
logic clk;
logic [(2*W-1):0] Z;
//logic [(2*W+(2*W-4)/3):0] bcd;
logic [19:0] bcd;
//
clock_gen #(0) U1 (.sys_clk(sys_clk), .reset(reset), .clk(clk));
seq_multiplier #(8) DUT (.clk(clk), .reset(reset), .start(start), .Multiplicand(X), .Multiplier(Y), .Result(Z), .Done(Done));
bin2bcd_p #(16) U4(Z, bcd); 
segment_16bit U3 (.sys_clk(sys_clk), .reset(reset), .seg_in(bcd[15:0]), .seg_sel(seg_sel), .seg_out(seg_out));
always_comb begin
 led_out = 4'b0000;
 if ((2*W+(2*W-4)/3)>16) 
   case (bcd[19:16])
    0: led_out=4'b0000;
    1: led_out=4'b0001;
    2: led_out=4'b0010;
    3: led_out=4'b0011;
    4: led_out=4'b0100;
    5: led_out=4'b0101;
    6: led_out=4'b0110;
    default: led_out=4'b0000;
   endcase    
end
//
endmodule

