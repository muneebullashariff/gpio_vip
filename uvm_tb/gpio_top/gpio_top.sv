//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_top.sv
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
`ifndef GPIO_TOP_SV
`define GPIO_TOP_SV

`include "gpio_if.sv" 
module top;

import gpio_pkg::*;
import uvm_pkg::*;

bit clock;

always 
 #20 clock = ~clock;

gpio_if in0(clock);

initial
  begin

  uvm_config_db #(virtual gpio_if)::set(null,"*","vif",in0);
  run_test("gpio_test"); 

  end


endmodule

`endif



//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_top.sv,v $
//
///////////////////////////////////////////////////////////////////////////


