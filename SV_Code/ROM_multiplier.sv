module ROM_multiplier  (
 input logic clk, Enable,
 input logic [7:0] Address,
 output logic [7:0] Data);

logic [7:0] rom [0:255] = {
            8'b00000000, // 0 * 0 = 0
            8'b00000000, // 0 * 1 = 0
            8'b00000000, // 0 * 2 = 0
            8'b00000000, // 0 * 3 = 0
            8'b00000000, // 0 * 4 = 0
            8'b00000000, // 0 * 5 = 0
            8'b00000000, // 0 * 6 = 0
            8'b00000000, // 0 * 7 = 0
            8'b00000000, // 0 * 8 = 0
            8'b00000000, // 0 * 9 = 0
            8'b00000000, // 0 * 10 = 0
            8'b00000000, // 0 * 11 = 0
            8'b00000000, // 0 * 12 = 0
            8'b00000000, // 0 * 13 = 0
            8'b00000000, // 0 * 14 = 0
            8'b00000000, // 0 * 15 = 0
            8'b00000000, // 1 * 0 = 0
            8'b00000001, // 1 * 1 = 1
            8'b00000010, // 1 * 2 = 2
            8'b00000011, // 1 * 3 = 3
            8'b00000100, // 1 * 4 = 4
            8'b00000101, // 1 * 5 = 5
            8'b00000110, // 1 * 6 = 6
            8'b00000111, // 1 * 7 = 7
            8'b00001000, // 1 * 8 = 8
            8'b00001001, // 1 * 9 = 9
            8'b00001010, // 1 * 10 = 10
            8'b00001011, // 1 * 11 = 11
            8'b00001100, // 1 * 12 = 12
            8'b00001101, // 1 * 13 = 13
            8'b00001110, // 1 * 14 = 14
            8'b00001111, // 1 * 15 = 15
            8'b00000000, // 2 * 0 = 0
            8'b00000010, // 2 * 1 = 2
            8'b00000100, // 2 * 2 = 4
            8'b00000110, // 2 * 3 = 6
            8'b00001000, // 2 * 4 = 8
            8'b00001010, // 2 * 5 = 10
            8'b00001100, // 2 * 6 = 12
            8'b00001110, // 2 * 7 = 14
            8'b00010000, // 2 * 8 = 16
            8'b00010010, // 2 * 9 = 18
            8'b00010100, // 2 * 10 = 20
            8'b00010110, // 2 * 11 = 22
            8'b00011000, // 2 * 12 = 24
            8'b00011010, // 2 * 13 = 26
            8'b00011100, // 2 * 14 = 28
            8'b00011110, // 2 * 15 = 30
            8'b00000000, // 3 * 0 = 0
            8'b00000011, // 3 * 1 = 3
            8'b00000110, // 3 * 2 = 6
            8'b00001001, // 3 * 3 = 9
            8'b00001100, // 3 * 4 = 12
            8'b00001111, // 3 * 5 = 15
            8'b00010010, // 3 * 6 = 18
            8'b00010101, // 3 * 7 = 21
            8'b00011000, // 3 * 8 = 24
            8'b00011011, // 3 * 9 = 27
            8'b00011110, // 3 * 10 = 30
            8'b00100001, // 3 * 11 = 33
            8'b00100100, // 3 * 12 = 36
            8'b00100111, // 3 * 13 = 39
            8'b00101010, // 3 * 14 = 42
            8'b00101101, // 3 * 15 = 45
            8'b00000000, // 4 * 0 = 0
            8'b00000100, // 4 * 1 = 4
            8'b00001000, // 4 * 2 = 8
            8'b00001100, // 4 * 3 = 12
            8'b00010000, // 4 * 4 = 16
            8'b00010100, // 4 * 5 = 20
            8'b00011000, // 4 * 6 = 24
            8'b00011100, // 4 * 7 = 28
            8'b00100000, // 4 * 8 = 32
            8'b00100100, // 4 * 9 = 36
            8'b00101000, // 4 * 10 = 40
            8'b00101100, // 4 * 11 = 44
            8'b00110000, // 4 * 12 = 48
            8'b00110100, // 4 * 13 = 52
            8'b00111000, // 4 * 14 = 56
            8'b00111100, // 4 * 15 = 60
            8'b00000000, // 5 * 0 = 0
            8'b00000101, // 5 * 1 = 5
            8'b00001010, // 5 * 2 = 10
            8'b00001111, // 5 * 3 = 15
            8'b00010100, // 5 * 4 = 20
            8'b00011001, // 5 * 5 = 25
            8'b00011110, // 5 * 6 = 30
            8'b00100011, // 5 * 7 = 35
            8'b00101000, // 5 * 8 = 40
            8'b00101101, // 5 * 9 = 45
            8'b00110010, // 5 * 10 = 50
            8'b00110111, // 5 * 11 = 55
            8'b00111100, // 5 * 12 = 60
            8'b01000001, // 5 * 13 = 65
            8'b01000110, // 5 * 14 = 70
            8'b01001011, // 5 * 15 = 75
            8'b00000000, // 6 * 0 = 0
            8'b00000110, // 6 * 1 = 6
            8'b00001100, // 6 * 2 = 12
            8'b00010010, // 6 * 3 = 18
            8'b00011000, // 6 * 4 = 24
            8'b00011110, // 6 * 5 = 30
            8'b00100100, // 6 * 6 = 36
            8'b00101010, // 6 * 7 = 42
            8'b00110000, // 6 * 8 = 48
            8'b00110110, // 6 * 9 = 54
            8'b00111100, // 6 * 10 = 60
            8'b01000010, // 6 * 11 = 66
            8'b01001000, // 6 * 12 = 72
            8'b01001110, // 6 * 13 = 78
            8'b01010100, // 6 * 14 = 84
            8'b01011010, // 6 * 15 = 90
            8'b00000000, // 7 * 0 = 0
            8'b00000111, // 7 * 1 = 7
            8'b00001110, // 7 * 2 = 14
            8'b00010101, // 7 * 3 = 21
            8'b00011100, // 7 * 4 = 28
            8'b00100011, // 7 * 5 = 35
            8'b00101010, // 7 * 6 = 42
            8'b00110001, // 7 * 7 = 49
            8'b00111000, // 7 * 8 = 56
            8'b00111111, // 7 * 9 = 63
            8'b01000110, // 7 * 10 = 70
            8'b01001101, // 7 * 11 = 77
            8'b01010100, // 7 * 12 = 84
            8'b01011011, // 7 * 13 = 91
            8'b01100010, // 7 * 14 = 98
            8'b01101001, // 7 * 15 = 105
            8'b00000000, // 8 * 0 = 0
            8'b00001000, // 8 * 1 = 8
            8'b00010000, // 8 * 2 = 16
            8'b00011000, // 8 * 3 = 24
            8'b00100000, // 8 * 4 = 32
            8'b00101000, // 8 * 5 = 40
            8'b00110000, // 8 * 6 = 48
            8'b00111000, // 8 * 7 = 56
            8'b01000000, // 8 * 8 = 64
            8'b01001000, // 8 * 9 = 72
            8'b01010000, // 8 * 10 = 80
            8'b01011000, // 8 * 11 = 88
            8'b01100000, // 8 * 12 = 96
            8'b01101000, // 8 * 13 = 104
            8'b01110000, // 8 * 14 = 112
            8'b01111000, // 8 * 15 = 120
            8'b00000000, // 9 * 0 = 0
            8'b00001001, // 9 * 1 = 9
            8'b00010010, // 9 * 2 = 18
            8'b00011011, // 9 * 3 = 27
            8'b00100100, // 9 * 4 = 36
            8'b00101101, // 9 * 5 = 45
            8'b00110110, // 9 * 6 = 54
            8'b00111111, // 9 * 7 = 63
            8'b01001000, // 9 * 8 = 72
            8'b01010001, // 9 * 9 = 81
            8'b01011010, // 9 * 10 = 90
            8'b01100011, // 9 * 11 = 99
            8'b01101100, // 9 * 12 = 108
            8'b01110101, // 9 * 13 = 117
            8'b01111110, // 9 * 14 = 126
            8'b10000111, // 9 * 15 = 135
            8'b00000000, // 10 * 0 = 0
            8'b00001010, // 10 * 1 = 10
            8'b00010100, // 10 * 2 = 20
            8'b00011110, // 10 * 3 = 30
            8'b00101000, // 10 * 4 = 40
            8'b00110010, // 10 * 5 = 50
            8'b00111100, // 10 * 6 = 60
            8'b01000110, // 10 * 7 = 70
            8'b01010000, // 10 * 8 = 80
            8'b01011010, // 10 * 9 = 90
            8'b01100100, // 10 * 10 = 100
            8'b01101110, // 10 * 11 = 110
            8'b01111000, // 10 * 12 = 120
            8'b10000010, // 10 * 13 = 130
            8'b10001100, // 10 * 14 = 140
            8'b10010110, // 10 * 15 = 150
            8'b00000000, // 11 * 0 = 0
            8'b00001011, // 11 * 1 = 11
            8'b00010110, // 11 * 2 = 22
            8'b00100001, // 11 * 3 = 33
            8'b00101100, // 11 * 4 = 44
            8'b00110111, // 11 * 5 = 55
            8'b01000010, // 11 * 6 = 66
            8'b01001101, // 11 * 7 = 77
            8'b01011000, // 11 * 8 = 88
            8'b01100011, // 11 * 9 = 99
            8'b01101110, // 11 * 10 = 110
            8'b01111001, // 11 * 11 = 121
            8'b10000100, // 11 * 12 = 132
            8'b10001111, // 11 * 13 = 143
            8'b10011010, // 11 * 14 = 154
            8'b10100101, // 11 * 15 = 165
            8'b00000000, // 12 * 0 = 0
            8'b00001100, // 12 * 1 = 12
            8'b00011000, // 12 * 2 = 24
            8'b00100100, // 12 * 3 = 36
            8'b00110000, // 12 * 4 = 48
            8'b00111100, // 12 * 5 = 60
            8'b01001000, // 12 * 6 = 72
            8'b01010100, // 12 * 7 = 84
            8'b01100000, // 12 * 8 = 96
            8'b01101100, // 12 * 9 = 108
            8'b01111000, // 12 * 10 = 120
            8'b10000100, // 12 * 11 = 132
            8'b10010000, // 12 * 12 = 144
            8'b10011100, // 12 * 13 = 156
            8'b10101000, // 12 * 14 = 168
            8'b10110100, // 12 * 15 = 180
            8'b00000000, // 13 * 0 = 0
            8'b00001101, // 13 * 1 = 13
            8'b00011010, // 13 * 2 = 26
            8'b00100111, // 13 * 3 = 39
            8'b00110100, // 13 * 4 = 52
            8'b01000001, // 13 * 5 = 65
            8'b01001110, // 13 * 6 = 78
            8'b01011011, // 13 * 7 = 91
            8'b01101000, // 13 * 8 = 104
            8'b01110101, // 13 * 9 = 117
            8'b10000010, // 13 * 10 = 130
            8'b10001111, // 13 * 11 = 143
            8'b10011100, // 13 * 12 = 156
            8'b10101001, // 13 * 13 = 169
            8'b10110110, // 13 * 14 = 182
            8'b11000011, // 13 * 15 = 195
            8'b00000000, // 14 * 0 = 0
            8'b00001110, // 14 * 1 = 14
            8'b00011100, // 14 * 2 = 28
            8'b00101010, // 14 * 3 = 42
            8'b00111000, // 14 * 4 = 56
            8'b01000110, // 14 * 5 = 70
            8'b01010100, // 14 * 6 = 84
            8'b01100010, // 14 * 7 = 98
            8'b01110000, // 14 * 8 = 112
            8'b01111110, // 14 * 9 = 126
            8'b10001100, // 14 * 10 = 140
            8'b10011010, // 14 * 11 = 154
            8'b10101000, // 14 * 12 = 168
            8'b10110110, // 14 * 13 = 182
            8'b11000100, // 14 * 14 = 196
            8'b11010010, // 14 * 15 = 210
            8'b00000000, // 15 * 0 = 0
            8'b00001111, // 15 * 1 = 15
            8'b00011110, // 15 * 2 = 30
            8'b00101101, // 15 * 3 = 45
            8'b00111100, // 15 * 4 = 60
            8'b01001011, // 15 * 5 = 75
            8'b01011010, // 15 * 6 = 90
            8'b01101001, // 15 * 7 = 105
            8'b01111000, // 15 * 8 = 120
            8'b10000111, // 15 * 9 = 135
            8'b10010110, // 15 * 10 = 150
            8'b10100101, // 15 * 11 = 165
            8'b10110100, // 15 * 12 = 180
            8'b11000011, // 15 * 13 = 195
            8'b11010010, // 15 * 14 = 210
            8'b11100001}; // 15 * 15 = 225
            
 always_ff @ (posedge clk) begin
  if (Enable) Data = rom[Address];
 end
//
endmodule