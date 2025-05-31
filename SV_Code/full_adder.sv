module full_adder(input logic a, b, cin,
output logic sum, carry);
  assign sum = a ^ b ^ cin; 
  assign carry = a & b | a & cin | b & cin;
endmodule
  