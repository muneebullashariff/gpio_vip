//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_sequence.sv
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
`ifndef GPIO_MASTER_SEQUENCE_SV
`define GPIO_MASTER_SEQUENCE_SV

 class gpio_master_sequence extends uvm_sequence #(gpio_master_transaction); 

// Registering with UVM Factory
 `uvm_object_utils(gpio_master_sequence)


 //=======================methods===================================
 extern function new(string name = "gpio_master_sequence");

 endclass

 //========================constructor=============================
 function gpio_master_sequence::new(string name = "gpio_master_sequence");
  super.new(name);
 endfunction

//ADDED
//*****************************************  SEQUENCES *************************************************************//
  class master_seqs1 extends  gpio_master_sequence;
  `uvm_object_utils(master_seqs1)

  extern function new(string name ="abc");
  extern task body();

 endclass

 function master_seqs1::new(string name = "abc");
  super.new(name);
 endfunction

 task master_seqs1::body();
 req = gpio_master_transaction::type_id::create("req");
  start_item(req);
  assert(req.randomize() with{paddir[7:0] == 8'b00000000; paddir[15:8] == 8'b11111111;} ); //RGPIO_OE Resgister
  finish_item(req);

 endtask


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_sequence.sv,v $
//
///////////////////////////////////////////////////////////////////////////

