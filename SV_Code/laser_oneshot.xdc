## Clock signal
set_property PACKAGE_PIN W5 [get_ports sys_clk]
	set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
## LEDs
set_property PACKAGE_PIN U16 [get_ports {x}]
	set_property IOSTANDARD LVCMOS33 [get_ports {x}]
##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN W19 [get_ports b]
	set_property IOSTANDARD LVCMOS33 [get_ports b]
## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
