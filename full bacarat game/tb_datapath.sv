module tb_datapath();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

reg slow_clock;
reg fast_clock;
reg resetb;

reg load_pcard1;
reg load_pcard2;
reg load_pcard3;

reg load_dcard1;
reg load_dcard2;
reg load_dcard3;

reg [3:0] pcard3_out;
reg [3:0] pscore_out;
reg [3:0] dscore_out;

reg [6:0] hex0;
reg [6:0] hex1;
reg [6:0] hex2;
reg [6:0] hex3;
reg [6:0] hex4;
reg [6:0] hex5;

datapath DUT(.slow_clock(slow_clock), .fast_clock(fast_clock),
.resetb(resetb), .load_pcard1(load_pcard1), .load_pcard2(load_pcard2), 
.load_pcard3(load_pcard3), .load_dcard1(load_dcard1), .load_dcard2(load_dcard2), 
.load_dcard3(load_dcard3), .pcard3_out(pcard3_out), .pscore_out(pscore_out), 
.dscore_out(dscore_out), .HEX0(hex0), .HEX1(hex1), .HEX2(hex2),
.HEX3(hex3), .HEX4(hex4), .HEX5(hex5));

initial begin
    fast_clock = 0;
    forever #5 fast_clock = ~fast_clock;
end

initial begin
    #5
    resetb = 1'b0;
    #50
    assert (pcard3_out == 4'b0000) $display("RESET == PCARD3_OUT = 0 CORRECT");
    else $display("RESET == PCARD3_OUT != 0 WRONG");

    assert (pscore_out == 4'b0000) $display("RESET == PSCORE_OUT = 0 CORRECT");
    else $display("RESET == PSCORE_OUT != 0 WRONG");

    assert (dscore_out == 4'b0000) $display("RESET == DSCORE_OUT = 0 CORRECT");
    else $display("RESET == DSCORE_OUT != 0 WRONG");

    assert (hex0 == 7'b1111111) $display("RESET == HEX0 = 0 CORRECT");
    else $display("RESET == HEX0 != 0 WRONG");

    assert (hex1 == 7'b1111111) $display("RESET == HEX1 = 0 CORRECT");
    else $display("RESET == HEX1 != 0 WRONG");

    assert (hex2 == 7'b1111111) $display("RESET == HEX2 = 0 CORRECT");
    else $display("RESET == HEX2 != 0 WRONG");

    assert (hex3 == 7'b1111111) $display("RESET == HEX3 = 0 CORRECT");
    else $display("RESET == HEX3 != 0 WRONG");

    assert (hex4 == 7'b1111111) $display("RESET == HEX4 = 0 CORRECT");
    else $display("RESET == HEX4 != 0 WRONG");

    assert (hex5 == 7'b1111111) $display("RESET == HEX5 = 0 CORRECT");
    else $display("RESET == HEX5 != 0 WRONG");


    // now testing to get if we get a new card for pcard1
    #5
    resetb = 1'b1;
    load_pcard1 = 1'b1;
    slow_clock = 1'b1;
    #5
    slow_clock = 1'b0;
    assert(pscore_out != 4'b0000) $display("value in pscore : correct");
    else $display("value in pscore = value of new, but new card was loaded");
    assert(hex0 != 7'b1111111) $display("value in hex0 : correct");
    else $display("value in hex = 0, but new card was loaded");

    /* so far after this, i was able to get a new card, and pass that new card into players'
       first card. Since I was only passing one new card, enabled it to pass to the first player
       new_card == next_pcard_1 == pscore which is correct   
    */

    #5
    resetb = 1'b0;
    #5
    resetb = 1'b1;
    #5

    // now after reset, let's load player card 1, dealer card 1, player card 2, dealer card 2 and see if they sum right and is correct

    load_pcard1 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_pcard1 = 1'b0;

    #5

    load_dcard1 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_dcard1 = 1'b0;

    #5

    load_pcard2 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_pcard2 = 1'b0;

    #5 

    load_dcard2 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_dcard2 = 1'b0;

    #5
    

    // at this point manually checking through wave form, i am able to physically see that the summation of the two first 
    // cards of both players sum to the right score value which is really good. 

    // now lets check to add a 3rd card for player 1 and see if pcard3_out is correct

    load_pcard3 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_pcard3 = 1'b0;

    // at this point pscore_out is correct, the test overflowed to decimal 12 which pscore showed the mod10 = 2
    // pcard3_out was the same value as next_pcard_3 which is correct
    // and pcard3 was released properly by enable signal


    // lastly lets check now for 3rd card for dealer and check if dscore_out with 3 cards is correct

    #5

    load_dcard3 = 1'b1;
    slow_clock = 1'b1;
    #1
    slow_clock = 1'b0;
    load_dcard3 = 1'b0;

    // at this point, dscore out was correct, the test overflowed to decimal 15 which dscore showed the mod10 = 5
    // dcard3 was also released at the proper time 





    /*
        list of things I tested:
            - reset to spit out proper values
            - generating a new card
            - generating players 1's first card with new card
            - generating player and dealers first two cards 
            - checking if score is correct for the first two cards
            - generating players and dealers 3rd cards 
            - chcking if score is correct for the full 3 cards
    */

    #10
    $stop;

end


						
endmodule

