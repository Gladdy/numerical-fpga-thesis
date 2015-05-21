create_clock -name master_clk -period 20 [get_ports {CLOCK_50}]
derive_pll_clocks
