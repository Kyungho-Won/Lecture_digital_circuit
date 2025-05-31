# Switches
set_property PACKAGE_PIN V17 [get_ports {a}]
	set_property IOSTANDARD LVCMOS33 [get_ports {a}]
set_property PACKAGE_PIN V16 [get_ports {b}]
	set_property IOSTANDARD LVCMOS33 [get_ports {b}]
set_property PACKAGE_PIN W16 [get_ports {cin}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cin}]

            
# LEDs
set_property PACKAGE_PIN U16 [get_ports {sum}]
    set_property IOSTANDARD LVCMOS33 [get_ports {sum}]
set_property PACKAGE_PIN E19 [get_ports {carry}]
    set_property IOSTANDARD LVCMOS33 [get_ports {carry}]
    
# Virtual Clock for timing analysis (e.g., 100 MHz = 10 ns period)
create_clock -name virtual_clk -period 10.0


