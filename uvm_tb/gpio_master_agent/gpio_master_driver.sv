//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_driver.sv
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
`ifndef GPIO_MASTER_DRIVER_SV
`define GPIO_MASTER_DRIVER_SV

class gpio_master_driver extends uvm_driver #(gpio_master_transaction);

// Registering with UVM Factory
 `uvm_component_utils(gpio_master_driver)

 gpio_master_config mcfg;

 virtual gpio_if.MDRV_MP vif;

 //=======================methods===================================
 extern function new(string name = "gpio_master_driver",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 //ADDED CODE
 extern task run_phase(uvm_phase phase);
 extern task data_sent_to_dut(gpio_master_transaction xtn);
 
 endclass

 //========================constructor=============================
  function gpio_master_driver::new(string name="gpio_master_driver",uvm_component parent);
   super.new(name,parent);
  endfunction

 //========================Build_phase=============================
 function void gpio_master_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
 
 if(!uvm_config_db #(gpio_master_config)::get(this,"","gpio_master_config",mcfg)) 
  `uvm_fatal(get_full_name,"CANNOT GET CONFIG FROM MDRV")

endfunction

//========================Connect_phase()===============
 function void gpio_master_driver::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
    vif = mcfg.vif;
 endfunction

//ADDED
task gpio_master_driver::run_phase(uvm_phase phase);
  super.run_phase(phase);
    forever
   begin
   seq_item_port.get_next_item(req);
   data_sent_to_dut(req);
   seq_item_port.item_done();
  end
 
 endtask

task gpio_master_driver::data_sent_to_dut(gpio_master_transaction xtn);
//`uvm_info("MASTER_DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW) 
  begin

 vif.MDRV.gpio_in <= xtn.gpio_in;
 
 $display("FROM MASTER DRIVER xtn.gpio_in =%d", xtn.gpio_in);
  
`uvm_info("MASTER_DRIVER",$sformatf("printing from driver \n %s", xtn.sprint()),UVM_LOW) 
  end
endtask




`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_driver.sv,v $
//
///////////////////////////////////////////////////////////////////////////

