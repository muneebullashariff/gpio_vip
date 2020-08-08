//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_config.sv
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
`ifndef GPIO_MASTER_CONFIG_SV
`define GPIO_MASTER_CONFIG_SV

class gpio_master_config extends uvm_object;

// Registering with UVM Factory
 `uvm_object_utils(gpio_master_config)

//======================declare virtual interface handle============
virtual gpio_if vif;

uvm_active_passive_enum is_active = UVM_ACTIVE;


 int has_scoreboard = 0;

 //=======================methods===================================
 extern function new(string name = "gpio_master_config");

 endclass

 //========================constructor=============================
 function gpio_master_config::new(string name = "gpio_master_config");
  super.new(name);
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_.sv,v $
//
///////////////////////////////////////////////////////////////////////////

