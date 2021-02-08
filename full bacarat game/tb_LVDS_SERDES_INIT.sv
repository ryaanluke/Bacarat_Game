module tb_LVDS_SERDES_INIT();

// inputs
reg clock, reset_signal, tb_rx_locked, tb_rx_dpa_locked;

// outputs
reg tb_pll_areset, tb_rx_reset, tb_rx_fifo_reset, tb_rx_cda_reset; 

LVD_IP_core_initialization DUT(
                            .clk(clock),
                            .reset(reset_signal),
                            .rx_locked(tb_rx_locked),
                            .rx_dpa_locked(tb_rx_dpa_locked),
                            .pll_areset(tb_pll_areset),
                            .rx_reset(tb_rx_reset),
                            .rx_fifo_reset(tb_rx_fifo_reset),
                            .rx_cda_reset(tb_rx_cda_reset)
                                );

initial begin
    
    // checking for reset to work
    #5
    reset_signal = 1'b1; // reset click
    clock = 1'b1; // clock click 
    #5
    reset_signal = 1'b0; // reset deasserted
    clock = 1'b0; // unclick clock 
    #5

    $display("--- RESET STATE OUTPUT CHECK ---");
    assert (tb_pll_areset == 1'b0) $display ("pll_reset = 0 EXPECTED") 
    else   $$display("pll_areset != 0 UNEXPECTED");

    assert (tb_rx_reset == 1'b0) $display ("rx_reset = 0 EXPECTED") 
    else   $$display("rx_reset != 0 UNEXPECTED");

    assert (tb_rx_fifo_reset == 1'b0) $display ("rx_fifo_reset = 0 EXPECTED") 
    else   $$display("rx_fifo_reset != 0 UNEXPECTED");

    assert (tb_rx_cda_reset == 1'b0) $display ("rx_cda_reset = 0 EXPECTED") 
    else   $$display("rx_cda_reset != 0 UNEXPECTED");

    $display("---                          ---");
    $display(" ");
end