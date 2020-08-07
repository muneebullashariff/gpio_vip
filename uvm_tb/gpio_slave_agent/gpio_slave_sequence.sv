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

//**********************SEQUENCES******************************
  class slave_seq1 extends gpio_slave_sequence;
  `uvm_object_utils(slave_seq1)

  extern function new(string name ="seq1");
  extern task body();

 endclass : slave_seq1

 function slave_seq1::new(string name = "seq1");
  super.new(name);
 endfunction : new

 task slave_seq1::body();
 req = gpio_slave_transaction::type_id::create("req");
  start_item(req);
  assert(req.randomize() with{paddir[7:0] == 8'b11111111; paddir[15:8] == 8'b00000000;} ); //RGPIO_OE Resgister
  finish_item(req);

 endtask : body

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_sequence.sv,v $
//
///////////////////////////////////////////////////////////////////////////

