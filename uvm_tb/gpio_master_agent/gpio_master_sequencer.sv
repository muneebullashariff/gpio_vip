//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_sequencer.sv
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
`ifndef GPIO_MASTER_SEQUENCER_SV
`define GPIO_MASTER_SEQUENCER_SV

 class gpio_master_sequencer extends uvm_sequencer #(gpio_master_transaction);

// Registering with UVM Factory
 `uvm_component_utils(gpio_master_sequencer)

 //=======================methods===================================
 extern function new(string name = "gpio_master_sequencer",uvm_component parent);
 extern function void build_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_master_sequencer::new(string name = "gpio_master_sequencer",uvm_component parent);
  super.new(name,parent);
 endfunction


 //========================Build_phase=============================
 function void gpio_master_sequencer::build_phase(uvm_phase phase);
  super.build_phase(phase);
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_sequencer.sv,v $
//
///////////////////////////////////////////////////////////////////////////

