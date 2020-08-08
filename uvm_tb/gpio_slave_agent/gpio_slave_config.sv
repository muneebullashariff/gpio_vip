//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_config.sv
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
`ifndef GPIO_SLAVE_CONFIG_SV
`define GPIO_SLAVE_CONFIG_SV


class gpio_slave_config extends uvm_object; 

// Registering with UVM Factory
 `uvm_object_utils(gpio_slave_config)

bit has_scoreboard = 0;

 uvm_active_passive_enum is_active = UVM_ACTIVE;


 //======================declare virtual interface handle==========
 virtual gpio_if vif;


 //=======================methods===================================
 extern function new(string name = "gpio_slave_config");


 endclass

 //========================constructor=============================
 function gpio_slave_config::new(string name = "gpio_slave_config");
  super.new(name);
 endfunction

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_config.sv,v $
///////////////////////////////////////////////////////////////////////////

