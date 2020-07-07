//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_env_config.sv
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
`ifndef GPIO_ENV_CONFIG_SV
`define GPIO_ENV_CONFIG_SV

class gpio_env_config extends uvm_object;

// Registering with UVM Factory
 `uvm_object_utils(gpio_env_config)
 
 gpio_master_config mcfg;
 gpio_slave_config scfg;

 
 bit has_magt=1;
 bit has_sagt=1;
 bit has_virtual_sequencer=1;
 bit has_scoreboard=1;


 //=======================methods===================================
 extern function new(string name = "gpio_env_config");

 endclass

 //========================constructor=============================
 function gpio_env_config::new(string name = "gpio_env_config");
  super.new(name);
 endfunction

 //========================Build_phase=============================



`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_env_config.sv,v $
//
///////////////////////////////////////////////////////////////////////////

