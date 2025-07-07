###############################################################################
# The KPU Processor - ZUBoard 1CG.xdc
###############################################################################

###############################################################################
# 0) Global Options
###############################################################################
(Optional) set_operating_conditions -airflow 0
(Optional) set_operating_conditions -heatsink low

###############################################################################
# 0.5) External PS Reference Clock (1.8 V bank)
#    ZUBoard 1CG Pin H14 = PS_REF_CLK_503
###############################################################################
#set_property PACKAGE_PIN H14 [get_ports clk]
#set_property IOSTANDARD LVCMOS18 [get_ports clk]

###############################################################################
# 1) Reset or push-button
#    The board's single push button is pinned at A8, 1.8 V
###############################################################################
set_property PACKAGE_PIN A8 [get_ports reset_n]
set_property IOSTANDARD LVCMOS18 [get_ports reset_n]

###############################################################################
# 2) GPIO Pins [0..7]
#    For illustration, I'm picking D8, G7, E5, G6, E8, F8, F7, and B9
###############################################################################
set_property PACKAGE_PIN D8 [get_ports {gpio_pins[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[0]}]

set_property PACKAGE_PIN G7 [get_ports {gpio_pins[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[1]}]

set_property PACKAGE_PIN E5 [get_ports {gpio_pins[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[2]}]

set_property PACKAGE_PIN G6 [get_ports {gpio_pins[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[3]}]

set_property PACKAGE_PIN E8 [get_ports {gpio_pins[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[4]}]

set_property PACKAGE_PIN F8 [get_ports {gpio_pins[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[5]}]

set_property PACKAGE_PIN F7 [get_ports {gpio_pins[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[6]}]

set_property PACKAGE_PIN B6 [get_ports {gpio_pins[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[7]}]

###############################################################################
# 3) GPIO Pins [8..11] for 1.8 V LED outputs
#    Map to the two on-board RGB LEDs (LED0: A7,B6,B5 ; LED1: B4,A2,F4).
###############################################################################

set_property PACKAGE_PIN A7 [get_ports {gpio_pins[8]}]  # LED0 red
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[8]}]

set_property PACKAGE_PIN B6 [get_ports {gpio_pins[9]}]  # LED0 green
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[9]}]

set_property PACKAGE_PIN B5 [get_ports {gpio_pins[10]}] # LED0 blue
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[10]}]

set_property PACKAGE_PIN B4 [get_ports {gpio_pins[11]}] # LED1 red
set_property IOSTANDARD LVCMOS18 [get_ports {gpio_pins[11]}]

###############################################################################
# 4) First UART (uart0) on click connector
#    D6 = TX, D7 = RX,
###############################################################################
set_property PACKAGE_PIN D6 [get_ports uart0_txd]
set_property IOSTANDARD LVCMOS18 [get_ports uart0_txd]

set_property PACKAGE_PIN D7 [get_ports uart0_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports uart0_rxd]

###############################################################################
# 5) Second UART (uart1) on different click pins
#    F6 = TX, E6 = RX
###############################################################################
set_property PACKAGE_PIN F6 [get_ports uart1_txd]
set_property IOSTANDARD LVCMOS18 [get_ports uart1_txd]

set_property PACKAGE_PIN E6 [get_ports uart1_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports uart1_rxd]

set_property PACKAGE_PIN D5 [get_ports {gpio_pins[11]}]
set_property PACKAGE_PIN D3 [get_ports {gpio_pins[10]}]
set_property PACKAGE_PIN D2 [get_ports {gpio_pins[9]}]
set_property PACKAGE_PIN D1 [get_ports {gpio_pins[8]}]

# declare the two PL clocks asynchronous to one another
set_clock_groups -asynchronous                  \
   -group [get_clocks clk_pl_0]                  \
   -group [get_clocks system_clk_ZynqPS_clk_wiz_0_3]