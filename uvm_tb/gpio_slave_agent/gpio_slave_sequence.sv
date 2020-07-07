//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_sequence.sv
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
`ifndef GPIO_SLAVE_SEQUENCE_SV
`define GPIO_SKAVE_SEQUENCE_SV

 class gpio_slave_sequence extends uvm_sequence #(gpio_slave_transaction);

// Registering with UVM Factory
 `uvm_object_utils(gpio_slave_sequence)

 //=======================methods===================================
 extern function new(string name = "gpio_slave_sequence");

 endclass

 //========================constructor=============================
 function gpio_slave_sequence::new(string name = "gpio_slave_sequence");
  super.new(name);
 endfunction



`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_sequence.sv,v $
//
///////////////////////////////////////////////////////////////////////////

