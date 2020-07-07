//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_agent.sv
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
`ifndef GPIO_MASTER_AGENT_SV
`define GPIO_MASTER_AGENT_SV

 class gpio_master_agent extends uvm_agent;

// Registering with UVM Factory
 `uvm_component_utils(gpio_master_agent)

 gpio_master_driver mdrv;
 gpio_master_monitor mmon;
 gpio_master_sequencer mseqr;


 gpio_master_config mcfg;


 //=======================methods===================================
 extern function new(string name = "gpio_master_agent",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_master_agent::new(string name ="gpio_master_agent",uvm_component parent);
  super.new(name,parent);
 endfunction

 //========================Build_phase=============================
 function void gpio_master_agent::build_phase(uvm_phase phase);
   super.build_phase(phase);

  if(!uvm_config_db #(gpio_master_config)::get(this,"","gpio_master_config",mcfg))
  `uvm_fatal(get_full_name,"CANNOT GET MCFG FROM MAGT")

   if(mcfg.is_active)
    begin
     mdrv  = gpio_master_driver::type_id::create("mdrv",this);
     mseqr = gpio_master_sequencer::type_id::create("mseqr",this);
    end

     mmon  = gpio_master_monitor::type_id::create("mmon",this);
 endfunction

//========================Connect_phase()===============
 function void gpio_master_agent::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   mdrv.seq_item_port.connect(mseqr.seq_item_export);
 endfunction

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_agent.sv,v $
//
///////////////////////////////////////////////////////////////////////////

