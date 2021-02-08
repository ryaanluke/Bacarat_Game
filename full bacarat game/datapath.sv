module datapath(input slow_clock, input fast_clock, input resetb,
                input load_pcard1, input load_pcard2, input load_pcard3,
                input load_dcard1, input load_dcard2, input load_dcard3,
                output reg [3:0] pcard3_out,
                output reg [3:0] pscore_out, output reg [3:0] dscore_out,
                output reg [6:0] HEX5, output reg [6:0] HEX4, output reg [6:0] HEX3,
                output reg [6:0] HEX2, output reg [6:0] HEX1, output reg [6:0] HEX0);
						
// The code describing your datapath will go here.  Your datapath 
// will hierarchically instantiate six card7seg blocks, two scorehand
// blocks, and a dealcard block.  The registers may either be instatiated
// or included as sequential always blocks directly in this file.
//
// Follow the block diagram in the Lab 1 handout closely as you write this code.

/*
    inputs:
        slow_clock
        fast_clock
        resetb
        load_pcard1
        load_pcard2
        load_pcard3
        load_dcard1
        load_dcard2
        load_dcard3

    outputs:
        pcard3_out
        pscore_out
        dscord_out
        HEX0
        HEX1
        HEX2
        HEX3
        HEX4
        HEX5 

    instantiations:
        card7seg x6
        scorehand x2
        dealcard x1

*/

// dealcard instantiation and wiring:
wire [3:0] new_card;
dealcard dealcard_datapath(fast_clock, resetb, new_card);

// new_card enters reg4's for player and dealer 
logic [3:0] next_pcard_1;
logic [3:0] next_pcard_2;
logic [3:0] next_pcard_3;

logic [3:0] next_dcard_1;
logic [3:0] next_dcard_2;
logic [3:0] next_dcard_3;


always @(posedge slow_clock or negedge resetb) begin
    if (resetb == 1'b0) begin
        next_pcard_1 <= 0;
        next_pcard_2 <= 0;
        next_pcard_3 <= 0;
        next_dcard_1 <= 0;
        next_dcard_2 <= 0;
        next_dcard_3 <= 0;
    end

    else if (load_pcard1 == 1'b1) begin
        next_pcard_1 <= new_card;
    end

    else if (load_pcard2 == 1'b1) begin
        next_pcard_2 <= new_card;
    end

    else if (load_pcard3 == 1'b1) begin
        next_pcard_3 <= new_card;
    end

    else if (load_dcard1 == 1'b1) begin
        next_dcard_1 <= new_card;
    end

    else if (load_dcard2 == 1'b1) begin
        next_dcard_2 <= new_card;
    end

    else if (load_dcard3 == 1'b1) begin
        next_dcard_3 <= new_card;
    end

    else begin
        next_pcard_1 <= next_pcard_1;
        next_pcard_2 <= next_pcard_2;
        next_pcard_3 <= next_pcard_3;
        next_dcard_1 <= next_dcard_1;
        next_dcard_2 <= next_dcard_2;
        next_dcard_3 <= next_dcard_3;

    end

end

// calculating scores using scorehand
// uses the loigic wires next_p/dcards
wire [3:0] pscore_out_inst;
wire [3:0] dscore_out_inst;

scorehand player_score(next_pcard_1, next_pcard_2, next_pcard_3, pscore_out_inst);
scorehand dealer_score(next_dcard_1, next_dcard_2, next_dcard_3, dscore_out_inst);

always@(*) begin
    pscore_out = pscore_out_inst;
    dscore_out = dscore_out_inst;
end

// displaying on hex and using card7seg
wire [6:0] HEX0_output;
wire [6:0] HEX1_output;
wire [6:0] HEX2_output;
wire [6:0] HEX3_output;
wire [6:0] HEX4_output;
wire [6:0] HEX5_output;

card7seg hex_pcard_1(next_pcard_1, HEX0_output);
card7seg hex_pcard_2(next_pcard_2, HEX1_output);
card7seg hex_pcard_3(next_pcard_3, HEX2_output);

card7seg hex_dcard_1(next_dcard_1, HEX3_output);
card7seg hex_dcard_2(next_dcard_2, HEX4_output);
card7seg hex_dcard_3(next_dcard_3, HEX5_output);

always@(*) begin
    HEX0 = HEX0_output;
    HEX1 = HEX1_output;
    HEX2 = HEX2_output;
    HEX3 = HEX3_output;
    HEX4 = HEX4_output;
    HEX5 = HEX5_output;
end

// lastly outputting pcard3 as well
always@(*) begin
    pcard3_out = next_pcard_3;
end



endmodule

