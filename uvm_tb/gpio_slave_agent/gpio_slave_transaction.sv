//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_transaction.sv
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
`ifndef GPIO_SLAVE_TRANSACTION_SV
`define GPIO_SLAVE_TRANSACTION_SV

 class gpio_slave_transaction extends uvm_sequence_item; 

// Registering with UVM Factory
// `uvm_object_utils(gpio_slave_transaction)

//================================================================
// Data Members
//================================================================ 
 
 	bit	[31:0]	GPn;
  rand	bit	[31:0]	paddir;
  	bit	[31:0]	padin;
  rand	bit	[31:0]	padout;
  rand	bit	[31:0]	inten;
  rand	bit	[31:0]	padcfg;
  rand	bit	[31:0]	inttype;
  rand	bit	[31:0]	intstatus;

// Registering class and class fileds with uvm factory
 `uvm_object_utils_begin(gpio_slave_transaction)
 `uvm_field_int(GPn,UVM_ALL_ON)
 `uvm_field_int(paddir,UVM_ALL_ON)
 `uvm_field_int(padin,UVM_ALL_ON)
 `uvm_field_int(padout,UVM_ALL_ON)
 `uvm_field_int(inten,UVM_ALL_ON)
 `uvm_field_int(padcfg,UVM_ALL_ON)
 `uvm_field_int(inttype,UVM_ALL_ON)
 `uvm_field_int(intstatus,UVM_ALL_ON)
 `uvm_object_utils_end


//=======================methods===================================
 extern function new(string name = "gpio_slave_transaction");

 endclass

 //========================constructor=============================
 function gpio_slave_transaction::new(string name ="gpio_slave_transaction");
  super.new(name);
 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_transaction.sv,v $
//
///////////////////////////////////////////////////////////////////////////

