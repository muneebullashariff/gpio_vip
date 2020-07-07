//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_package.sv
//      Description   : This file consists of all files.
//      code
//
//      Parent Module :
//
//      Child Module  : ---
//
//*************************************************************************************
//      Author        : 
//      Created on    : 
//      File Id       :
//*************************************************************************************
`ifndef GPIO_PACKAGE_SV
`define GPIO_PACKAGE_SV


package gpio_pkg;

import uvm_pkg::*;

`include "uvm_macros.svh"

`include "gpio_master_transaction.sv"
`include "gpio_master_config.sv"
`include "gpio_slave_config.sv"
`include "gpio_env_config.sv"

`include "gpio_master_driver.sv"
`include "gpio_master_monitor.sv"
`include "gpio_master_sequencer.sv"
`include "gpio_master_agent.sv"
`include "gpio_master_sequence.sv"

`include "gpio_slave_transaction.sv"
`include "gpio_slave_driver.sv"
`include "gpio_slave_monitor.sv"
`include "gpio_slave_sequencer.sv"
`include "gpio_slave_agent.sv"
`include "gpio_slave_sequence.sv"

`include "gpio_virtual_sequencer.sv"
`include "gpio_virtual_sequence.sv"
`include "gpio_scoreboard.sv"
`include "gpio_env.sv"
`include "gpio_test.sv"

endpackage

`endif


//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_package.sv,v $
//
///////////////////////////////////////////////////////////////////////////


