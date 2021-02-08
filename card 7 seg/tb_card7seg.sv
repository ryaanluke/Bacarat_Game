module tb_card7seg();

// Your testbench goes here. Make sure your tests exercise the entire design
// in the .sv file.  Note that in our tests the simulator will exit after
// 10,000 ticks (equivalent to "initial #10000 $finish();").

reg [3:0] switches;
reg [6:0] hex;

card7seg DUT(switches, hex);

initial begin

    #5
    switches = 4'b0000;
    #5
    assert (hex == 7'b1111111) $display("CASE 0000 - 1111111: SWITCH AND HEX MATCH");
    else $display("CASE 0000 - 1111111: FAILED");


    #5
    switches = 4'b0001;
    #5
    assert (hex == 7'b0001000) $display("CASE 0001 - 0001000: SWITCH AND HEX MATCH");
    else $display("CASE 0001 - 0001000: FAILED");



    #5
    switches = 4'b0010;
    #5
    assert (hex == 7'b0100100) $display("CASE 0010 - 0100100: SWITCH AND HEX MATCH");
    else $display("CASE 0010 - 0100100: FAILED");


    #5
    switches = 4'b0011;
    #5
    assert (hex == 7'b0110000) $display("CASE 0011 - 0110000: SWITCH AND HEX MATCH");
    else $display("CASE 0011 - 0110000: FAILED");


    #5
    switches = 4'b0100;
    #5
    assert (hex == 7'b0011001) $display("CASE 0100 - 0011001: SWITCH AND HEX MATCH");
    else $display("CASE 0100 - 0011001: FAILED");


    #5
    switches = 4'b0101;
    #5
    assert (hex == 7'b0010010) $display("CASE 0101 - 0010010: SWITCH AND HEX MATCH");
    else $display("CASE 0101 - 0010010: FAILED");


    #5
    switches = 4'b0110;
    #5
    assert (hex == 7'b0000010) $display("CASE 0110 - 0000010: SWITCH AND HEX MATCH");
    else $display("CASE 0110 - 0000010: FAILED");


    #5
    switches = 4'b0111;
    #5
    assert (hex == 7'b1111000) $display("CASE 0111 - 1111000: SWITCH AND HEX MATCH");
    else $display("CASE 0111 - 1111000: FAILED");


    #5
    switches = 4'b1000;
    #5
    assert (hex == 7'b0000000) $display("CASE 1000 - 0000000: SWITCH AND HEX MATCH");
    else $display("CASE 1000 - 0000000: FAILED");

    #5
    switches = 4'b1001;
    #5
    assert (hex == 7'b0010000) $display("CASE 1001 - 0010000: SWITCH AND HEX MATCH");
    else $display("CASE 1001 - 0010000: FAILED");
  

    #5
    switches = 4'b1010;
    #5
    assert (hex == 7'b1000000) $display("CASE 1010 - 1000000: SWITCH AND HEX MATCH");
    else $display("CASE 1010 - 1000000: FAILED");

    #5
    switches = 4'b1011;
    #5
    assert (hex == 7'b1100001) $display("CASE 1011 - 1100001: SWITCH AND HEX MATCH");
    else $display("CASE 1011 - 1100001: FAILED");
    

    #5
    switches = 4'b1100;
    #5
    assert (hex == 7'b0011000) $display("CASE 1100 - 0011000: SWITCH AND HEX MATCH");
    else $display("CASE 1100 - 0011000: FAILED");

    #5
    switches = 4'b1101;
    #5
    assert (hex == 7'b0001001) $display("CASE 1101 - 0001001: SWITCH AND HEX MATCH");
    else $display("CASE 1101 - 0001001: FAILED");

    #5
    switches = 4'b1110;
    #5
    assert (hex == 7'b1111111) $display("CASE 1110 - 1111111: SWITCH AND HEX MATCH");
    else $display("CASE 1110 - 1111111: FAILED");

    #5
    switches = 4'b1111;
    #5
    assert (hex == 7'b1111111) $display("CASE 1111 - 1111111: SWITCH AND HEX MATCH");
    else $display("CASE 1111 - 1111111: FAILED");


    #5
    switches = 4'bxxxx;
    #5
    assert (hex == 7'bxxxxxxx) $display("CASE xxxx - xxxxxxx: SWITCH AND HEX MATCH");
    else $display("CASE xxxx - xxxxxxx: FAILED");




    #10
    $stop;

end


						
endmodule

