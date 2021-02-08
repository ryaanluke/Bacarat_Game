module card7seg(input [3:0] card, output reg [6:0] seg7);

   // your code goes here
   always@(*)begin
      case(card)
         4'b0000: seg7 = 7'b1111111; // blank
         4'b0001: seg7 = 7'b0001000; // ace
         4'b0010: seg7 = 7'b0100100; // 2 
         4'b0011: seg7 = 7'b0110000; // 3
         4'b0100: seg7 = 7'b0011001; // 4
         4'b0101: seg7 = 7'b0010010; // 5
         4'b0110: seg7 = 7'b0000010; // 6  
         4'b0111: seg7 = 7'b1111000; // 7
         4'b1000: seg7 = 7'b0000000; // 8
         4'b1001: seg7 = 7'b0010000; // 9
         4'b1010: seg7 = 7'b1000000; // 10
         4'b1011: seg7 = 7'b1100001; // j
         4'b1100: seg7 = 7'b0011000; // q
         4'b1101: seg7 = 7'b0001001; // k
         4'b1110: seg7 = 7'b1111111; // blank
         4'b1111: seg7 = 7'b1111111; // blank
         default: seg7 = 7'bxxxxxxx; 
      endcase
   end

endmodule

