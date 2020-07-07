//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_sequencer.sv
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
`ifndef GPIO_SLAVE_SEQUENCER_SV
`define GPIO_SLAVE_SEQUENCER_SV


 class gpio_slave_sequencer extends uvm_sequencer #(gpio_slave_transaction);

// Registering with UVM Factory
 `uvm_component_utils(gpio_slave_sequencer)

 //=======================methods===================================
 extern function new(string name = "gpio_slave_sequencer",uvm_component parent);
 extern function void build_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
 function gpio_slave_sequencer::new(string name = "gpio_slave_sequencer",uvm_component parent);
  super.new(name,parent);
 endfunction

 //========================Build_phase=============================
 function void gpio_slave_sequencer::build_phase(uvm_phase phase);
    super.build_phase(phase);
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_sequencer.sv,v $
//
///////////////////////////////////////////////////////////////////////////

