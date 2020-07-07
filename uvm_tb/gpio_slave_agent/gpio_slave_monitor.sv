//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_monitor.sv
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
`ifndef GPIO_SLAVE_MONITOR_SV
`define GPIO_SLAVE_MONITOR_SV

 class gpio_slave_monitor extends uvm_monitor;

// Registering with UVM Factory
 `uvm_component_utils(gpio_slave_monitor)

 virtual gpio_if.SMON_MP vif;

 gpio_slave_transaction sxtn;

 gpio_slave_config scfg;

 uvm_analysis_port #(gpio_slave_transaction) analysis_port;

 //=======================methods===================================
 extern function new(string name = "gpio_slave_monitor",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_slave_monitor::new(string name = "gpio_slave_monitor",uvm_component parent);
  super.new(name,parent);
  analysis_port = new("analysis_port",this);
 endfunction


 //========================Build_phase=============================
 function void gpio_slave_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
   if(!uvm_config_db #(gpio_slave_config)::get(this,"","gpio_slave_config",scfg))
   `uvm_fatal(get_full_name,"CANNOT GET CONFIG FROM SLAVE IN SMON")

 endfunction

//========================Connect_phase()===============
 function void gpio_slave_monitor::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   vif = scfg.vif;
 endfunction



`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_monitor.sv,v $
//
///////////////////////////////////////////////////////////////////////////

