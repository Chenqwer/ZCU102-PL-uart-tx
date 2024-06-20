set_property PACKAGE_PIN G21 [get_ports clk_p]
set_property IOSTANDARD LVDS_25 [get_ports clk_p]
set_property PACKAGE_PIN AM13 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]
set_property PACKAGE_PIN AL12 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property PACKAGE_PIN A22 [get_ports uart_tx]
set_property PACKAGE_PIN AN14 [get_ports {data[0]}]
set_property PACKAGE_PIN AP14 [get_ports {data[1]}]
set_property PACKAGE_PIN AM14 [get_ports {data[2]}]
set_property PACKAGE_PIN AN13 [get_ports {data[3]}]
set_property PACKAGE_PIN AN12 [get_ports {data[4]}]
set_property PACKAGE_PIN AP12 [get_ports {data[5]}]
set_property PACKAGE_PIN AL13 [get_ports {data[6]}]
set_property PACKAGE_PIN AK13 [get_ports {data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports uart_tx]
create_clock -period 8.000 -name clk_125 -waveform {0.000 4.000} [get_ports clk_p]
