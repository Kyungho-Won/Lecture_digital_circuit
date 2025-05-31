## Clock signal
set_property PACKAGE_PIN W5 [get_ports sys_clk]
	set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]
## Switches
set_property PACKAGE_PIN V17 [get_ports {B[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
set_property PACKAGE_PIN V16 [get_ports {B[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
set_property PACKAGE_PIN W16 [get_ports {B[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
set_property PACKAGE_PIN W17 [get_ports {B[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]

set_property PACKAGE_PIN V2 [get_ports {A[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]
set_property PACKAGE_PIN T3 [get_ports {A[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]
set_property PACKAGE_PIN T2 [get_ports {A[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]
set_property PACKAGE_PIN R3 [get_ports {A[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]

set_property PACKAGE_PIN R2 [get_ports {Sel}]
	set_property IOSTANDARD LVCMOS33 [get_ports {Sel}]

##7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg_out[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg_out[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg_out[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg_out[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg_out[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg_out[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg_out[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[6]}]
set_property PACKAGE_PIN V7 [get_ports {seg_out[7]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_out[7]}]

set_property PACKAGE_PIN U2 [get_ports {seg_sel[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[0]}]
set_property PACKAGE_PIN U4 [get_ports {seg_sel[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[1]}]
set_property PACKAGE_PIN V4 [get_ports {seg_sel[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[2]}]
set_property PACKAGE_PIN W4 [get_ports {seg_sel[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {seg_sel[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]
	set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Configuration options, can be used for all designs
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]