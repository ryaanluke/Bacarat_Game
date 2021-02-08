`timescale 1 ps / 1 ps

module tb_task5();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 100,000 ticks (equivalent to "initial #100000 $finish();").

reg [3:0] slow_clock_or_reset; // KEY[0] = slow_clock KEY[3] = reset
reg fast_clock;

reg [9:0] LEDR;
reg [6:0] HEX0;
reg [6:0] HEX1;
reg [6:0] HEX2;
reg [6:0] HEX3;
reg [6:0] HEX4;
reg [6:0] HEX5;

task5 DUT (fast_clock, slow_clock_or_reset, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

initial begin
    fast_clock = 0;
    forever #1 fast_clock = ~fast_clock;
end

initial begin
    // resetting to start 
    #5
    slow_clock_or_reset = 4'b0001 ; // click reset and clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick reset and clock 
    #5

    $display("--- RESET STATE OUTPUT CHECK ---");

    assert (HEX0 == 7'b1111111) $display ("HEX0 OFF : CORRECT");
    else $display ("HEX0 ON : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 == 7'b1111111) $display ("HEX3 OFF : CORRECT");
    else $display ("HEX3 ON : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal pcard1 

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 1 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 == 7'b1111111) $display ("HEX3 OFF : CORRECT");
    else $display ("HEX3 ON : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal dcard2 

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 2 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal pcard2

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 3 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OF : INCORRECT");

    assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
    else $display ("HEX1 OFF : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal dcard2 

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 4 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 On : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
    else $display ("HEX1 OFF : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 != 7'b1111111) $display ("HEX4 ON : CORRECT");
    else $display ("HEX4 OFF : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // resetting mid state to start again
    #5
    slow_clock_or_reset = 4'b0001 ; // click reset and clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick reset and clock 
    #5
    $display("--- RESTARTING GAME AMIDST MID GAME, TO SIMULATE NEW MATCH---");
    $display("--- RESET STATE OUTPUT CHECK ---");

    assert (HEX0 == 7'b1111111) $display ("HEX0 OFF : CORRECT");
    else $display ("HEX0 ON : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 == 7'b1111111) $display ("HEX3 OFF : CORRECT");
    else $display ("HEX3 ON : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 1 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 == 7'b1111111) $display ("HEX3 OFF : CORRECT");
    else $display ("HEX3 ON : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal dcard2 

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 2 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 == 7'b1111111) $display ("HEX1 OFF : CORRECT");
    else $display ("HEX1 ON : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal pcard2

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 3 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
    else $display ("HEX0 OF : INCORRECT");

    assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
    else $display ("HEX1 OFF : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 == 7'b1111111) $display ("HEX4 OFF : CORRECT");
    else $display ("HEX4 ON : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    $display(" ");

    // deal dcard2 

    #5
    slow_clock_or_reset = 4'b1001 ; // click  clock
    #5
    slow_clock_or_reset = 4'b1000 ; // unclick clock 
    #5

    $display("--- DEAL CARD 4 OUTPUT CHECK ---");

    assert (HEX0 != 7'b1111111) $display ("HEX0 On : CORRECT");
    else $display ("HEX0 OFF : INCORRECT");

    assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
    else $display ("HEX1 OFF : INCORRECT");

    assert (HEX2 == 7'b1111111) $display ("HEX2 OFF : CORRECT");
    else $display ("HEX2 ON : INCORRECT");

    assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
    else $display ("HEX3 OFF : INCORRECT");

    assert (HEX4 != 7'b1111111) $display ("HEX4 ON : CORRECT");
    else $display ("HEX4 OFF : INCORRECT");

    assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
    else $display ("HEX5 ON : INCORRECT");

    $display(" ");
    
    if (LEDR == 10'bxx10011001) // player and dealer had score of 9
        begin
            $display ("SCORE - 9:9");
            assert (LEDR == 10'b1110011001) $display("P9 | D9 : BOTH WIN LIGHTS CORRECT");
            else $display ("P9 | D9 : WIN LIGHTS INCORRECT");
        end
    else if (LEDR == 10'bxx10001000) // player and dealer had score of 8
        begin
            $display ("SCORE - 8:8");
            assert (LEDR == 10'b1110001000) $display ("P8 | D8 : BOTH WIN LIGHTS CORRECT");
            else $display ("P8 | D8 : WIN LIGHTS INCORRECT");
        end
    else if (LEDR == 10'bxxxxxx1001) // player wins with score of 9
        begin
            $display ("SC0RE - 9:X");
            assert (LEDR == 10'b01xxxx1001) $display ("P9 | DX : PLAYER WIN LIGHT CORRECT");
            else $display ("P9 | DX : PLAYER WIN LIGHT INCORRECT");
        end

    else if (LEDR == 10'bxxxxxx1000) // player wins with score of 8
        begin
            $display ("SC0RE - 8:X");
            assert (LEDR == 10'b01xxxx1000) $display ("P8 | DX : PLAYER WIN LIGHT CORRECT");
            else $display ("P8 | DX : PLAYER WIN LIGHT INCORRECT");
        end 

    else if (LEDR == 10'bxx1001xxxx) // dealer wins with score of 9
        begin
            $display ("SC0RE - X:9");
            assert (LEDR == 10'b101001xxxx) $display ("PX | D9 : DEALER WIN LIGHT CORRECT");
            else $display ("PX | D9 : DEALER WIN LIGHT INCORRECT");
        end

    else if (LEDR == 10'bxx1000xxxx) // dealer wins with score of 8
        begin
            $display ("SC0RE - X:8");
            assert (LEDR == 10'b101000xxxx) $display ("PX | D8 : PLAYER WIN LIGHT CORRECT");
            else $display ("PX | D8 : PLAYER WIN LIGHT INCORRECT");
        end 

    else
        begin
            $display ("NO NATURAL CASE - CHECK IF PCARD 3 AND DCARD 3 GETS RELEASED");

            #5
            slow_clock_or_reset = 4'b1001 ; // click  clock
            #5
            slow_clock_or_reset = 4'b1000 ; // unclick clock 
            #5

            $display("--- DEAL CARD 5 OUTPUT CHECK ---");

            assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
            else $display ("HEX0 OFF : INCORRECT");

            assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
            else $display ("HEX1 OFF : INCORRECT");

            assert (HEX2 != 7'b1111111) $display ("HEX2 ON : CORRECT");
            else $display ("HEX2 OFF : INCORRECT");

            assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
            else $display ("HEX3 OFF : INCORRECT");

            assert (HEX4 != 7'b1111111) $display ("HEX4 ON : CORRECT");
            else $display ("HEX4 OFF : INCORRECT");

            assert (HEX5 == 7'b1111111) $display ("HEX5 OFF : CORRECT");
            else $display ("HEX5 ON : INCORRECT");

            $display(" ");

            #5
            slow_clock_or_reset = 4'b1001 ; // click  clock
            #5
            slow_clock_or_reset = 4'b1000 ; // unclick clock 
            #5

            $display("--- DEAL CARD 6 OUTPUT CHECK ---");

            assert (HEX0 != 7'b1111111) $display ("HEX0 ON : CORRECT");
            else $display ("HEX0 OFF : INCORRECT");

            assert (HEX1 != 7'b1111111) $display ("HEX1 ON : CORRECT");
            else $display ("HEX1 OFF : INCORRECT");

            assert (HEX2 != 7'b1111111) $display ("HEX2 ON : CORRECT");
            else $display ("HEX2 OFF : INCORRECT");

            assert (HEX3 != 7'b1111111) $display ("HEX3 ON : CORRECT");
            else $display ("HEX3 OFF : INCORRECT");

            assert (HEX4 != 7'b1111111) $display ("HEX4 ON : CORRECT");
            else $display ("HEX4 OFF : INCORRECT");

            assert (HEX5 != 7'b1111111) $display ("HEX5 ON : CORRECT");
            else $display ("HEX5 OFF : INCORRECT");

            $display(" ");

            #5
            slow_clock_or_reset = 4'b1001 ; // click  clock
            #5
            slow_clock_or_reset = 4'b1000 ; // unclick clock 
            #5

            $display ("--- CHECKING END GAME LIGHTS ---");
            if (LEDR == 10'b01xxxxxxxx) // player win
                begin
                    $display ("PLAYER WON");
                    assert (LEDR == 10'b01xxxxxxxx) $display("PLAYER WIN LIGHT CORRECT");
                    else $display ("PLAYER WIN LIGHT INCORRECT");
                end

            else if (LEDR == 10'b10xxxxxxxx) // dealer win
                begin
                    $display ("DEALER WON");
                    assert (LEDR == 10'b10xxxxxxxx) $display("DEALER WIN LIGHT CORRECT");
                    else $display ("DEALER WIN LIGHT INCORRECT");
                end

            else if (LEDR == 10'b11xxxxxxxx) // tie
                begin
                    $display ("TIE CASE");
                    assert (LEDR == 10'b11xxxxxxxx) $display("TIE LIGHTS CORRECT");
                    else $display ("TIE LIGHTS INCORRECT");
                end

            else 
                $display ("ERROR THERE SHOULD BE WIN LIGHTS");
        end
    


    #10
    $stop;
end

						
endmodule

