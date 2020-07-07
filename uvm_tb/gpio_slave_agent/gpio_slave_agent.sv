//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_agent.sv
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
`ifndef GPIO_SLAVE_AGENT_SV
`define GPIO_SLAVE_AGENT_SV

class gpio_slave_agent extends uvm_agent;

// Registering with UVM Factory
 `uvm_component_utils(gpio_slave_agent)

 gpio_slave_config scfg;

 gpio_slave_driver sdrv;
 gpio_slave_sequencer sseqr;
 gpio_slave_monitor smon;
 

//=======================methods===================================
 extern function new(string name = "gpio_slave_agent",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_slave_agent::new(string name = "gpio_slave_agent",uvm_component parent);
   super.new(name,parent);
 endfunction

 //========================Build_phase=============================
 function void gpio_slave_agent::build_phase(uvm_phase phase);
  super.build_phase(phase);
   
  if(!uvm_config_db #(gpio_slave_config)::get(this,"","gpio_slave_config",scfg))
   `uvm_fatal(get_full_name,"CANNOT GET SCFG FROM SAGT")

 if(scfg.is_active) 
  begin
   sdrv  = gpio_slave_driver::type_id::create("sdrv",this);
   sseqr = gpio_slave_sequencer::type_id::create("sseqr",this);
  end
 
  smon = gpio_slave_monitor::type_id::create("smon",this);
 endfunction

 //========================Connect_phase=============================
 function void gpio_slave_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   
    sdrv.seq_item_port.connect(sseqr.seq_item_export); 

 endfunction

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_agent.sv,v $
//
///////////////////////////////////////////////////////////////////////////

