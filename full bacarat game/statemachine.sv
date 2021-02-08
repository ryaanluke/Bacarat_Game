`define state_0 4'b0000 // reset state / start game / load_pcard1 enabled | LIVE OUTPUTS: NOTHING
`define state_1 4'b0001 // load_dcard1 enabled | LIVE OUTPUTS: PCARD1
`define state_2 4'b0010 // load_pcard2 enabled | LIVE OUTPUTS: DCARD1 
`define state_3 4'b0011 // load_dcard2 enabled | LIVE OUTPUTS: PCARD 2
`define state_4 4'b0100 // load_pcard3 enabled/disabled OR finishes the game with natural case | LIVE OUTPUTS: DCARD2
// `define state_5 4'b0101 // buffer stage / two-card score determined *CURRENTLY OUT*
`define state_6 4'b0110  // 3rd card case 1 (pscore = 0 to 5): load_dcard3 enabled/disabled depending on logic | LIVE OUPUTS: PCARD3 
`define state_7 4'b0111  // 3rd card case 2 (pscore = 6 or 7): load_dcard3 enabled/disabled depending on logic | LIVE OUPUTS: PCARD3 
// `define state_8 4'b1000 // load_dcard3 enabled or disable depending on logic *CURRENTLY OUT*
`define end_state 4'b1111 // Score and determine winner | | LIVE OUPUTS: DCARD3 & 3-CARD SCORE 



module statemachine(input slow_clock, input resetb,
                    input [3:0] dscore, input [3:0] pscore, input [3:0] pcard3,
                    output reg load_pcard1, output reg load_pcard2,output reg load_pcard3,
                    output reg load_dcard1, output reg load_dcard2, output reg load_dcard3,
                    output reg player_win_light, output reg dealer_win_light);

// The code describing your state machine will go here.  Remember that
// a state machine consists of next state logic, output logic, and the 
// registers that hold the state.  You will want to review your notes from
// CPEN 211 or equivalent if you have forgotten how to write a state machine.

// Wiring the combinational logic the a D-FlipFlop to enable memory and proper holding of states
wire [3:0] present_state, next_state_reset;
reg [3:0] next_state;
vDFF #4 STATE(slow_clock, next_state_reset, present_state); // slow_clock determines whether present_state will be next_state or reset
assign next_state_reset = resetb == 1'b0 ? `state_0 : next_state; // multiplexer behaviour for next_state_reset to either be reset_state or next_state


// next state and output logic

always@(*) begin
    case (present_state)
        // Reset to automated two-card dealing
        `state_0: next_state = `state_1; // STATE 0 enabled load_pcard1
        `state_1: next_state = `state_2; // STATE 1 enabled load_dcard1
        `state_2: next_state = `state_3; // STATE 2 enabled load_pcard2 
        `state_3: next_state = `state_4; // STATE 3 enabled load_dcard2
        // `state_4: next_state = `state_5; // STATE 5 : Buffer stage | Extra clock-cycle to allow pscore and dscore to catch up
        `state_4: begin // STATE 4 enabled/disabled load_pcard3 OR finishes the game with a natural case 
                    if (pscore == 4'b1000 || pscore == 4'b1001 || dscore == 4'b1000 || dscore == 4'b1001)
                        begin
                            next_state = `state_0; // NATURAL : Either scores 8 or 9 so game ends and goes to END STATE
                        end

                    else if (pscore == 4'b0110 || pscore == 4'b0111)
                        begin
                            next_state = `state_7; // 3rd card case 1 (pscore == 6 or 7) : ENTER STATE 7 
                        end

                    else 
                        begin
                            next_state = `state_6; // 3rd card case 2 (pscore is between 0 to 5) : ENTER STATE 6
                        end
                  end
        /*
        `state_5: begin 
                    if (pscore == 4'b1000 || pscore == 4'b1001 || dscore == 4'b1000 || dscore == 4'b1001)
                        begin
                            next_state = `end_state; // NATURAL : Either scores 8 or 9 so game ends and goes to END STATE
                        end

                    else if (pscore == 4'b0110 || pscore == 4'b0111)
                        begin
                            next_state = `state_7; // 3rd card case 1 (pscore == 6 or 7) : ENTER STATE 7 
                        end

                    else 
                        begin
                            next_state = `state_6; // 3rd card case 2 (pscore is between 0 to 5) : ENTER STATE 6
                        end
                  end
        */
        `state_6: next_state = `end_state; // STATE 6 enabled load_pcard3
        `state_7: next_state = `end_state; // STATE 7 disabled load_pcard3 & determines if load_dcard3 is enabled/disabled
        // `state_8: next_state = `end_state; // STATE 8 determines if load_dcard3 is enabled/disabled for 3rd card case 1 & disables load_pcard3
        `end_state: next_state = `state_0; // END STATE determines winner -> clear/reset STATE 0 once over 
        default: next_state = 3'bxxx;
    endcase
end


always@(*) begin
    case (present_state)

        // STATE 0 OUTPUTS: load_pcard1 ENABLED so that next transition we have pcard1
        `state_0: begin
                    load_pcard1 = 1'b1; // ENABLE SIGNAL
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                  end

        // STATE 1 OUTPUTS: load_dcard1 ENABLED so that next transition we have dcard1 & pcard1
        `state_1: begin
                    load_pcard1 = 1'b0; 
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b1; // load_dcard1 ENABLE SIGNAL
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                  end

        // STATE 2 OUTPUTS: load_pcard2 ENABLED so that next transition we have pcard1, dcard1, pcard2
        `state_2: begin
                    load_pcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_pcard2 = 1'b1; // load_pcard2 ENABLE SIGNAL
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0; 
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                  end

        // STATE 3 OUTPUTS: load_dcard2 ENABLED so that next state transition we have pcard1, dcard1, pcard2, dcard2, updated pscore, updated dscore
        `state_3: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0; 
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b1; // load_dcard2 ENABLE SIGNAL
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                  end

        // BY NOW WE HAVE PCARD1, DCARD1, PCARD2, DCARD2, TWO CARD PSCORE, TWO CARD DSCORE 
        // STATE 4 OUTPUTS: TWO CARD WIN CASE : GAME END CASE or load_pcard3 ENABLED/DISABLED so that next transition we have pcard1, pcard2, pcard3, dcard1, dcard2
        `state_4:  begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0; 
                    
                    // NOW WANT TO CHECK IF THERE IS A NATURAL CASE FOR THE INITIAL TWO CARD SCORE


                    if ((pscore == 4'b1001 || pscore == 4'b1000) && (dscore != 4'b1001 & dscore != 4'b1000)) // Player natural win case
                        begin
                            player_win_light = 1'b1; 
                            dealer_win_light = 1'b0;
                        end

                    else if ((dscore == 4'b1001 || dscore == 4'b1000) && (pscore != 4'b1001 & pscore != 4'b1000)) // Dealer natural win case
                        begin
                            player_win_light = 1'b0;
                            dealer_win_light = 1'b1;
                        end

                    else if ((pscore == 4'b1001 || pscore == 4'b1000) && (dscore == 4'b1001 || dscore == 4'b1000)) // Both natural case 
                    	begin    
                            if (pscore > dscore) // Player win case
                            begin
                                player_win_light = 1'b1; 
                                dealer_win_light = 1'b0;
                            end

                            else if (pscore == dscore) // Player - Dealer tie case
                            begin
                                player_win_light = 1'b1;
                                dealer_win_light = 1'b1;
                            end

                            else // Dealer win case 
                            begin
                                dealer_win_light = 1'b1;
                                player_win_light = 1'b0;
                            end
                    	end    

                    // IF NO NATURAL CASE, DETERMINE IMMEDIATE OUTPUT OF load_pcard3
                    else if (pscore == 4'b0110 || pscore == 4'b0111) // 6 | 7 case 
                        begin
                            load_pcard3 = 1'b0;
                        end
                    else // NEITHER 6,7,8,9 SO 0 TO 5 
                        begin
                            load_pcard3 = 1'b1;
                        end
                   end

        // STATE 5 OUTPUTS: NONE
        // INFORMATION PROVIDED BY STATE 5: pcard1, pcard2, dcard1, dcard2, and two-card scores: pscore , dscore
        /*
        `state_5: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0; 
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                  end
        */
        // STATE 6 OUTPUTS (3RD CARD CASE: PSCORE = 0 to 5): load_pcard3 ENABLED 

        `state_6: begin
                    /*
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b1; // load_pcard3 ENABLE SIGNAL
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                    */

                    begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0; // load_pcard3 now DISABLED to make way for load_dcard3
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;

                    if (dscore == 4'b0111) 
                        begin
                            load_dcard3 = 1'b0;
                        end
                    
                    else if (dscore == 4'b0110)
                        begin
                            if (pcard3 == 4'b0110 || pcard3 == 4'b0111)
                                load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                            else
                                load_dcard3 = 1'b0;
                        end

                    else if (dscore == 4'b0101)
                        begin
                            if (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111)
                                load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                            else
                                load_dcard3 = 1'b0;
                        end

                    else if (dscore == 4'b0100)
                        begin
                            if (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111 || pcard3 == 4'b0010 || pcard3 == 4'b0011)
                                load_dcard3 = 1'b1;
                            else    
                                load_dcard3 = 1'b0;
                        end
                    else if (dscore == 4'b0011)
                        begin
                            if (pcard3 != 4'b1000)
                                load_dcard3 = 1'b1;
                            else    
                                load_dcard3 = 1'b0;
                        end
                        
                    else
                        begin
                            load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                        end
                   
                  end
		end

        // STATE 7 OUTPUTS (3RD CARD CASE: PSCORE = 6 | 7) : load_pcard3 DISABLED & load_dcard3 ENABLED/DISABLED    
        `state_7: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0; 
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;

                    if (dscore == 4'b0000 || dscore == 4'b0001 || dscore == 4'b0010 || dscore == 4'b0011 || dscore == 4'b0100 || dscore == 4'b0101)
                        load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                    else 
                        load_dcard3 = 1'b0;
                  end

        // STATE 8 OUTPUTS (CORRESPONDING TO STATE 6 - 3RD CARD CASE 0 to 5) : load_dcard3 ENABLED/DISABLED
        /*
        `state_8: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0; // load_pcard3 now DISABLED to make way for load_dcard3
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;

                    if (dscore == 4'b0111) 
                        begin
                            load_dcard3 = 1'b0; // load_dcard3 DISABLE SIGNAL
                        end

                    else if (dscore == 4'b0110) 
                        begin
                            if (pcard3 == 4'b0110 || pcard3 == 4'b0111)
                                load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                            else
                                load_dcard3 = 1'b0;
                        end

                    else if (dscore == 4'b0101)
                        begin
                            if (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111)
                                load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                            else
                                load_dcard3 = 1'b0;
                        end

                    else if (dscore == 4'b0100)
                        begin
                            if (pcard3 == 4'b0100 || pcard3 == 4'b0101 || pcard3 == 4'b0110 || pcard3 == 4'b0111 || pcard3 == 4'b0010 || pcard3 == 4'b0011)
                                load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                            else
                                load_dcard3 = 1'b0;
                        end

                    else
                        begin
                            load_dcard3 = 1'b1; // load_dcard3 ENABLE SIGNAL
                        end
                   end
        */
        // END STATE OUTPUTS : player_win_light ENABLED/DISABLED & dealer_win_light ENABLED/DISABLED
        `end_state: begin
                    load_pcard1 = 1'b0;
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;

                    if (pscore > dscore) // Player win case
                        begin
                            player_win_light = 1'b1; 
                            dealer_win_light = 1'b0;
                        end

                    else if (pscore == dscore) // Player - Dealer tie case
                        begin
                            player_win_light = 1'b1;
                            dealer_win_light = 1'b1;
                        end

                    else // Dealer tie case 
                        begin
                            dealer_win_light = 1'b1;
                            player_win_light = 1'b0;
                        end
                    end

        default:    begin
                    load_pcard1 = 1'b0; // ENABLE SIGNAL
                    load_pcard2 = 1'b0;
                    load_pcard3 = 1'b0;
                    load_dcard1 = 1'b0;
                    load_dcard2 = 1'b0;
                    load_dcard3 = 1'b0;
                    player_win_light = 1'b0;
                    dealer_win_light = 1'b0;
                    end

    endcase
end
endmodule


module vDFF(clk, in, out);
    parameter n = 1; 
    input clk;
    input [n-1:0] in;
    output reg [n-1:0] out;
    always@(posedge clk)
        out = in;
endmodule
