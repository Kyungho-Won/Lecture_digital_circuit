module segment_16bit  (
 input sys_clk, reset,
 input logic [15:0] seg_in,
 output logic [3:0] seg_sel,
 output logic [7:0] seg_out);

logic [3:0] seg_state, next_seg_state;
logic [31:0] cnt_clk;
//logic div_clk;
logic div_clk2;

always_ff @ (posedge sys_clk, posedge reset)
begin
  if (reset) cnt_clk=0;
  else cnt_clk = cnt_clk + 1;
end

//assign div_clk = cnt_clk[25];
assign div_clk2 = cnt_clk[18];

function logic [7:0] bin_7seg (input logic [3:0] in); 
  logic [7:0] seg_out;
  case (in) 
   0: seg_out = 8'b11000000; // "0"  
   1: seg_out = 8'b11111001; // "1" 
   2: seg_out = 8'b10100100; // "2" 
   3: seg_out = 8'b10110000; // "3" 
   4: seg_out = 8'b10011001; // "4" 
   5: seg_out = 8'b10010010; // "5" 
   6: seg_out = 8'b10000010; // "6" 
   7: seg_out = 8'b11111000; // "7" 
   8: seg_out = 8'b10000000; // "8"  
   9: seg_out = 8'b10010000; // "9" 
   10: seg_out = 8'b10100000; // "a"
   11: seg_out = 8'b10000011; // "b"
   12: seg_out = 8'b11000110; // "c"
   13: seg_out = 8'b10100001; // "d"
   14: seg_out = 8'b10000110; // "e"
   default: seg_out = 8'b10001110; // "f"
  endcase 
 return(seg_out);
endfunction

always_ff @ (posedge div_clk2, posedge reset)
begin
  if (reset) seg_state=4'b1110;
  else seg_state = next_seg_state;
end
always_comb begin
  case (seg_state)
   4'b1110: next_seg_state = 4'b1101;
   4'b1101: next_seg_state = 4'b1011;
   4'b1011: next_seg_state = 4'b0111;
   default: next_seg_state = 4'b1110;
  endcase
end

assign seg_sel = seg_state; 

always_comb begin
  case (seg_state)
    4'b1110: seg_out = bin_7seg(seg_in[3:0]);
    4'b1101: seg_out = bin_7seg(seg_in[7:4]);
    4'b1011: seg_out = bin_7seg(seg_in[11:8]);
    4'b0111: seg_out = bin_7seg(seg_in[15:12]);
    default: seg_out = bin_7seg(4'b0000);
  endcase
end

endmodule