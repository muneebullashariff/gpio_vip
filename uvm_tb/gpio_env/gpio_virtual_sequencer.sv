//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_virtual_sequencer.sv
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
`ifndef GPIO_VIRTUAL_SEQUENCER_SV
`define GPIO_VIRTUAL_SEQUENCER_SV

class gpio_virtual_sequencer extends uvm_sequencer #(uvm_sequence_item);

// Registering with UVM Factory
`uvm_component_utils(gpio_virtual_sequencer)

 gpio_env_config env_cfg;

 gpio_master_sequencer m_seqr;



 extern function new(string name = "gpio_virtual_sequencer",uvm_component parent);
 extern function void build_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_virtual_sequencer::new(string name = "gpio_virtual_sequencer",uvm_component parent);
  super.new(name,parent);
 endfunction

 
 //========================Build_phase=============================
 function void gpio_virtual_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
   
  if(!uvm_config_db #(gpio_env_config)::get(this,"","gpio_env_config",env_cfg))
  `uvm_fatal(get_full_name,"CANNOT GET CONFIG FOR ENV FROM VSEQR")
  
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_virtual_sequencer.sv,v $
//
///////////////////////////////////////////////////////////////////////////

