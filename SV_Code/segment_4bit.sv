module segment_4bit (
 input sys_clk, reset,
 input logic [3:0] Segment_In,
 output logic [3:0] Segment_Sel,
 output logic [7:0] Segment_Out);
//
logic [3:0] segment_state, next_segment_state;
logic [31:0] cnt_clk;
logic div_clk2;
//
always_ff @ (posedge sys_clk, posedge reset)
begin
  if (reset) cnt_clk=0;
  else cnt_clk = cnt_clk + 1;
end
assign div_clk2 = cnt_clk[18];
//
function logic [7:0] binary_7segment (input logic [3:0] in); 
  logic [7:0] seg_out;
 case (in) 
  4'h0: seg_out = 8'b11000000; // "0"  
  4'h1: seg_out = 8'b11111001; // "1" 
  4'h2: seg_out = 8'b10100100; // "2" 
  4'h3: seg_out = 8'b10110000; // "3" 
  4'h4: seg_out = 8'b10011001; // "4" 
  4'h5: seg_out = 8'b10010010; // "5" 
  4'h6: seg_out = 8'b10000010; // "6" 
  4'h7: seg_out = 8'b11111000; // "7" 
  4'h8: seg_out = 8'b10000000; // "8"  
  4'h9: seg_out = 8'b10010000; // "9" 
  4'ha: seg_out = 8'b10100000; // "a"
  4'hb: seg_out = 8'b10000011; // "b"
  4'hc: seg_out = 8'b11000110; // "c"
  4'hd: seg_out = 8'b10100001; // "d"
  4'he: seg_out = 8'b10000110; // "e"
  default: seg_out = 8'b10001110; // "f"
 endcase 
 return(seg_out);
endfunction
//
always_ff @ (posedge div_clk2, posedge reset)
begin
 if (reset) segment_state=4'b1111;
 else segment_state = next_segment_state;
end
always_comb begin
 case (segment_state)
  4'b1110: next_segment_state = 4'b1101;
  4'b1101: next_segment_state = 4'b1011;
  4'b1011: next_segment_state = 4'b0111;
  4'b0111: next_segment_state = 4'b1110;
  default: next_segment_state = 4'b1110;
 endcase
end

assign Segment_Sel = segment_state; 

always_comb begin
 case (segment_state)
  4'b1110: Segment_Out = binary_7segment(Segment_In);
  default: Segment_Out = 8'b11111111;
 endcase
end

endmodule