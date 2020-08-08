//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_virtual_sequence.sv
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
`ifndef GPIO_VIRTUAL_SEQUENCE_SV
`define GPIO_VIRTUAL_SEQUENCE_SV

class virtual_sequence extends uvm_sequence #(uvm_sequence_item);

// Registering with UVM Factory
`uvm_object_utils(virtual_sequence)


 //=======================declare handles for sequencers===================================
 gpio_master_sequencer mseqr;


 //=======================declare handle for env ===================================
 gpio_env_config env_cfg;

 
 //=======================declare handle for vitual sequencer===================================
gpio_virtual_sequencer v_seqr;

 //=======================methods===================================
 extern function new(string name = "virtual_sequence");

 endclass

 //========================constructor=============================
 function virtual_sequence::new(string name ="virtual_sequence");
  super.new(name);
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: virtual_sequence.sv,v $
//
///////////////////////////////////////////////////////////////////////////

