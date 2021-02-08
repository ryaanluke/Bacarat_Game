module tb_scorehand();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

reg [3:0] card_one, card_two, card_three;
reg [3:0] test_score;

scorehand DUT(card_one, card_two, card_three, test_score);

initial begin
    // testing elementary operations
    #5
    card_one = 4'b0001;    
    card_two = 4'b0001;    
    card_three = 4'b0001;
    #5
    assert (test_score == 4'b0011) $display("1 + 1 + 1 = 3 : CORRECT");
    else $display("1 + 1 + 1 = 3 : FAIL ");

    // testing only one card having value
    #5
    card_one = 4'b0111;    
    card_two = 4'b0000;    
    card_three = 4'b0000;
    #5
    assert (test_score == 4'b0111) $display("9 + 0 + 0 = 9 : CORRECT");
    else $display("9 + 0 + 0 = 9 : FAIL ");

    // testing only two cards having value
    #5
    card_one = 4'b0111;    
    card_two = 4'b0001;    
    card_three = 4'b0000;
    #5
    assert (test_score == 4'b1000) $display("7 + 1 + 0 = 8 : CORRECT");
    else $display("7 + 1 + 0 = 8 : FAIL ");

    // testing three card sum having value greater than 10 to be bounded between 0-0
    #5
    card_one = 4'b0111;    
    card_two = 4'b0011;    
    card_three = 4'b0001;
    #5
    assert (test_score == 4'b0001) $display("7 + 3 + 1 = 11 : CORRECT");
    else $display("7 + 3 + 1 = 11 : FAIL ");

    // Testing three card's to have maximum bits, and value greater than 10
    #5
    card_one = 4'b1111;    
    card_two = 4'b1111;    
    card_three = 4'b1111;
    #5
    assert (test_score == 4'b0101) $display("15 + 15 + 15 = 45 : CORRECT");
    else $display("15 + 15 + 15 = 45 : FAIL ");

    #10
    $stop;

end
						
endmodule

