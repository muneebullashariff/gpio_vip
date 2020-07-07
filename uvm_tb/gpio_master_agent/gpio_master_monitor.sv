//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_monitor.sv
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
`ifndef GPIO_MASTER_MONITOR_SV
`define GPIO_MASTER_MONITOR_SV

 class gpio_master_monitor extends uvm_monitor;

// Registering with UVM Factory
 `uvm_component_utils(gpio_master_monitor)

 virtual gpio_if.MMON_MP vif;

 gpio_master_config mcfg;

 gpio_master_transaction mxtn;

 uvm_analysis_port #(gpio_master_transaction) analysis_port;

 //=======================methods===================================
 extern function new(string name = "gpio_master_monitor",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_master_monitor::new(string name = "gpio_master_monitor",uvm_component parent);
  super.new(name,parent);
  analysis_port = new("analysis_port",this);
 endfunction


 //========================Build_phase=============================
 function void gpio_master_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db #(gpio_master_config)::get(this,"","gpio_master_config",mcfg))
   `uvm_fatal(get_full_name,"CANNOT GET MCFG FROM MASTER IN MMON"); 

endfunction

//========================Connect_phase()===============
 function void gpio_master_monitor::connect_phase(uvm_phase phase);
 super.connect_phase(phase);
  vif = mcfg.vif;
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_monitor.sv,v $
//
///////////////////////////////////////////////////////////////////////////

