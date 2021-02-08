module tb_statemachine();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

/*
    inputs: slow_clock, resetb, dscore, pscore, pcard3
    outputs: load_pcard1, load_pcard2, load_pcard3, load_dcard1, load_dcard2, load_dcard3, player_win_light, dealer_win_light

*/

reg slow_clock;
reg resetb;

reg [3:0] pcard3_in;
reg [3:0] pscore_in;
reg [3:0] dscore_in;

reg load_pcard1;
reg load_pcard2;
reg load_pcard3;
reg load_dcard1;
reg load_dcard2;
reg load_dcard3;

reg player_win_light;
reg dealer_win_light;

statemachine DUT(slow_clock, resetb, dscore_in, pscore_in, pcard3_in, load_pcard1, load_pcard2, load_pcard3, 
                    load_dcard1, load_dcard2, load_dcard3, player_win_light, dealer_win_light);

initial begin
        // checking for reset to work, since its synch'd to slow clock we need to wait one clock cycle
        #5
        resetb = 1'b0; // click reset
        slow_clock = 1'b1; // click clock
        #5
        resetb = 1'b1; // unclick reset | debounce
        slow_clock = 1'b0; // unclick clock
        #5

        $display("--- RESET STATE OUTPUT CHECK ---");
        assert (load_pcard1 == 1'b1) $display ("load_pcard1 = 1 : CORRECT");
        else $display("load_pcard1 != 1 : INCORRECT");

        assert (load_pcard2 == 1'b0) $display ("load_pcard2 = 0 : CORRECT");
        else $display("load_pcard2 != 0 : INCORRECT");

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT");
        else $display("load_pcard3 != 0 : INCORRECT");

        assert (load_dcard1 == 1'b0) $display ("load_dcard1 = 0 : CORRECT");
        else $display("load_dcard1 != 0 : INCORRECT");

        assert (load_dcard2 == 1'b0) $display ("load_dcard2 = 0 : CORRECT");
        else $display("load_dcard2 != 0 : INCORRECT");

        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT");
        else $display("load_dcard3 != 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // checking for switching between STATE 0 (reset) to STATE 1 : triggered by slow_clock : only one-clock cycle
        
        #5
        resetb = 1'b1;
        slow_clock = 1'b1;
        #5
        slow_clock = 1'b0;
        #5

        $display("--- STATE 1 OUTPUT CHECK ---");
        assert (load_pcard1 == 1'b0) $display ("load_pcard1 = 0 : CORRECT");
        else $display("load_pcard1 != 0 : INCORRECT");

        assert (load_pcard2 == 1'b0) $display ("load_pcard2 = 0 : CORRECT");
        else $display("load_pcard2 != 0 : INCORRECT");

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT");
        else $display("load_pcard3 != 0 : INCORRECT");

        assert (load_dcard1 == 1'b1) $display ("load_dcard1 = 1 : CORRECT");
        else $display("load_dcard1 != 1 : INCORRECT");

        assert (load_dcard2 == 1'b0) $display ("load_dcard2 = 0 : CORRECT");
        else $display("load_dcard2 != 0 : INCORRECT");

        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT");
        else $display("load_dcard3 != 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // checking for switching between STATE 1 to STATE 2
        
        #5
        resetb = 1'b1;
        slow_clock = 1'b1;
        #5
        slow_clock = 1'b0;
        #5

        $display("--- STATE 2 OUTPUT CHECK ---");
        assert (load_pcard1 == 1'b0) $display ("load_pcard1 = 0 : CORRECT");
        else $display("load_pcard1 != 0 : INCORRECT");

        assert (load_pcard2 == 1'b1) $display ("load_pcard2 = 1 : CORRECT");
        else $display("load_pcard2 != 1 : INCORRECT");

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT");
        else $display("load_pcard3 != 0 : INCORRECT");

        assert (load_dcard1 == 1'b0) $display ("load_dcard1 = 0 : CORRECT");
        else $display("load_dcard1 != 0 : INCORRECT");

        assert (load_dcard2 == 1'b0) $display ("load_dcard2 = 0 : CORRECT");
        else $display("load_dcard2 != 0 : INCORRECT");

        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT");
        else $display("load_dcard3 != 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // checking for switching between STATE 2 to STATE 3

        
        #5
        resetb = 1'b1;
        slow_clock = 1'b1;
        #5
        slow_clock = 1'b0;
        #5

        $display("--- STATE 3 OUTPUT CHECK ---");
        assert (load_pcard1 == 1'b0) $display ("load_pcard1 = 0 : CORRECT");
        else $display("load_pcard1 != 0 : INCORRECT");

        assert (load_pcard2 == 1'b0) $display ("load_pcard2 = 0 : CORRECT");
        else $display("load_pcard2 != 0 : INCORRECT");

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT");
        else $display("load_pcard3 != 0 : INCORRECT");

        assert (load_dcard1 == 1'b0) $display ("load_dcard1 = 0 : CORRECT");
        else $display("load_dcard1 != 0 : INCORRECT");

        assert (load_dcard2 == 1'b1) $display ("load_dcard2 = 1 : CORRECT");
        else $display("load_dcard2 != 1 : INCORRECT");

        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT");
        else $display("load_dcard3 != 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");


        
       #1000 
        /*
            at this point we need to test the different ways state 54transitions
        */

        
        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE ---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1001;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 9 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        
        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 2---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1000;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 8 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 3---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b1001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 9");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 4---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b1000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 8");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 5---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1001;
        dscore_in = 4'b1000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 9 | DSCORE = 8");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 6---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1000;
        dscore_in = 4'b1001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 8 | DSCORE = 9");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 7---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1001;
        dscore_in = 4'b1001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 9 | DSCORE = 9");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 4 -> NATURAL CASE 
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : NATURAL CASE 8---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b1000;
        dscore_in = 4'b1000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 8 | DSCORE = 8");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;

        #1 // waiting 1 second cause immediate outputs at this state need to be delayed for modelsim
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");

        $display("---                          ---");
        $display(" ");


        #1000 
        
        /*
            at this point we need to test the different ways state 4 transitions
        */
        
        // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 1---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0110;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 6 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 6 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7\

        $display("SIMULATED DSCORE = 0");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 6 | DSCORE 0 = load_dcard3 = 1");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 6 | DSCORE 0 = load_dcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0110;
        dscore_in = 4'b0001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 6 | DSCORE = 1 : NEW DCARD3 = 1");
        #1
            
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 2---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0111;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 7 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 7 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7
        

        $display("SIMULATED DSCORE = 0");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 7 | DSCORE 0 = load_dcard3 = 1");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 6 | DSCORE 0 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0111;
        dscore_in = 4'b0001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 7 | DSCORE = 1 : NEW DCARD3 = 1");
        #1    
        
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 3---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0111;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 7 | DSCORE = 3");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 7 | DSCORE 3 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 3 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7\

        $display("SIMULATED DSCORE = 3");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 7 | DSCORE 3 = load_dcard3 = 1");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 6 | DSCORE 3 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state

        pscore_in = 4'b0111;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 7 | DSCORE = 4 : NEW DCARD = 1");
        #1

        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 4---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0111;
        dscore_in = 4'b0111;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 7 | DSCORE = 7");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 7 | DSCORE 7 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 7 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7\

        $display("SIMULATED DSCORE = 7");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 7 | DSCORE 7 = load_dcard3 = 1");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 7 | DSCORE 7 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
            
        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 5---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0110;
        dscore_in = 4'b0111;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 6 | DSCORE = 7");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 6 | DSCORE 7 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 7 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7\

        $display("SIMULATED DSCORE = 7");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 6 | DSCORE 7 = load_dcard3 = 1");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 6 | DSCORE 7 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
            
        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 6 | 7 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 6 | 7 CASE 6---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0110;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 6 | DSCORE = 3");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b0) $display ("load_pcard3 = 0 : CORRECT : PSCORE 6 | DSCORE 3 = load_pcard3 = 0");
        else $display("load_pcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 3 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 7\

        $display("SIMULATED DSCORE = 3");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 6 | DSCORE 3 = load_dcard3 = 1");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 6 | DSCORE 3 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0110;
        dscore_in = 4'b1000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 6 | DSCORE = 8 : NEW DCARD = 5");
        
        #1
        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        #1000 
        
        /*
            at this point we need to test the different ways state 4 transitions
        */
        
        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 1---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6

        $display("SIMULATED DSCORE = 0");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0001;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 1 | DSCORE = 3 : PCARD 3 = 1 DCARD3 = 3");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 2---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0011;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 3 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6

        $display("SIMULATED DSCORE = 0");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0100;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 4 | DSCORE = 4 : PCARD 3 = 1 DCARD3 = 4");
        #1

        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");


        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 3---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0011;
        dscore_in = 4'b0000;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 3 | DSCORE = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6

        $display("SIMULATED DSCORE = 0");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0100;
        dscore_in = 4'b0010;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 4 | DSCORE = 2 : PCARD 3 = 1 DCARD3 = 2");
        #1

        assert (player_win_light == 1'b1) $display ("player_win_light = 1 : CORRECT");
        else $display ("player_win_light = 0 : INCORRECT");

        assert (dealer_win_light == 1'b0) $display ("dealer_win_light = 0 : CORRECT");
        else $display ("dealer_win_light = 1 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 4---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0011;
        dscore_in = 4'b0111;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 3 | DSCORE = 7");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 0 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6

        $display("SIMULATED DSCORE = 7");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 0 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0011;
        dscore_in = 4'b0111;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 3 | DSCORE = 7 : PCARD3 = 0 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 5---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0110;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 6---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0111;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 7---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 8---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 9---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 10---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0101;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 11---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 12---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0110;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");
        
        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 13---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 14---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0111;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");
        
        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 15---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 16---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0001;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 17---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 18---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b1001;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

        // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 19---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0101;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 6");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 6 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 6 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 20---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0100;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 21---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0010;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 22---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0011;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 23---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0001;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 24---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0100;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b1000;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 25---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b1000;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b0) $display ("load_dcard3 = 0 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 1 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 26---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b1001;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 27---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0011;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0010;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 28---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b1000;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");

         // TESTING: STATE 5 -> STATE_7 (PSOCRE 0 -> 5 CASE)
        // resetting game 
        $display("--- STATE 4 OUTPUT CHECK : CASE STATE 4 -> END GAME : 0 -> 5 CASE 29---");
        #5
        resetb = 1'b0;
        slow_clock = 1'b1;
        #5
        resetb = 1'b1;
        slow_clock = 1'b0; 
        // now in state 0
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 1
        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 2

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 3

        // checking player win score = 9 case 
        pscore_in = 4'b0000;
        dscore_in = 4'b0001;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 4

        assert (load_pcard3 == 1'b1) $display ("load_pcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");
        else $display("load_pcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_pcard3 = 0");

        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in state 6
        pcard3_in = 4'b0101;
        #1
        $display("SIMULATED DSCORE = 5");
        assert (load_dcard3 == 1'b1) $display ("load_dcard3 = 1 : CORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");
        else $display("load_dcard3 = 0 : INCORRECT : PSCORE 0 | DSCORE 5 = load_dcard3 = 0");


        #1
        slow_clock = 1'b1;
        #1
        slow_clock = 1'b0;
        // now in end state
        pscore_in = 4'b0000;
        dscore_in = 4'b0110;
        $display("SIMULATED STATE 4 SCORE : PSCORE = 0 | DSCORE = 5 : PCARD3 = 6 ");
        #1

        assert (player_win_light == 1'b0) $display ("player_win_light = 0 : CORRECT");
        else $display ("player_win_light = 1 : INCORRECT");

        assert (dealer_win_light == 1'b1) $display ("dealer_win_light = 1 : CORRECT");
        else $display ("dealer_win_light = 0 : INCORRECT");


        $display("---                          ---");
        $display(" ");


    #10
    $stop;
end

						
endmodule

