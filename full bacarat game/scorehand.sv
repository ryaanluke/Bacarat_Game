module scorehand(input [3:0] card1, input [3:0] card2, input [3:0] card3, output reg [3:0] total);

// The code describing scorehand will go here.  Remember this is a combinational
// block. The function is described in the handout.  Be sure to review the section
// on representing numbers in the lecture notes.

    wire [5:0] score;
    wire [3:0] card1_calc, card2_calc, card3_calc;
    assign card1_calc = (card1 == 4'd10 || card1 == 4'd11 || card1 == 4'd12 || card1 == 4'd13) ? 0: card1;
    assign card2_calc = (card2 == 4'd10 || card2 == 4'd11 || card2 == 4'd12 || card2 == 4'd13) ? 0: card2;
    assign card3_calc = (card3 == 4'd10 || card3 == 4'd11 || card3 == 4'd12 || card3 == 4'd13) ? 0: card3;
    assign score = (card1_calc + card2_calc + card3_calc) % 4'd10;
    assign total = score[3:0];


endmodule

