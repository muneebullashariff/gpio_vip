//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_slave_driver.sv
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
`ifndef GPIO_SLAVE_DRIVER_SV
`define GPIO_SLAVE_DRIVER_SV

class gpio_slave_driver extends uvm_driver #(gpio_slave_transaction);

// Registering with UVM Factory
 `uvm_component_utils(gpio_slave_driver)

 gpio_slave_config scfg;

 virtual gpio_if vif;

 uvm_analysis_port #(gpio_slave_transaction) sdrv_ap;

 //=======================methods===================================
 extern function new(string name = "gpio_slave_driver",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);
 extern task data_sent_to_master(gpio_slave_transaction sdrv_xtn);

 endclass : gpio_slave_driver

 //========================constructor=============================
  function gpio_slave_driver::new(string name="gpio_slave_driver",uvm_component parent);
   super.new(name,parent);
  endfunction : new

 //========================Build_phase=============================
 function void gpio_slave_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
 
 if(!uvm_config_db #(gpio_slave_config)::get(this,"","gpio_slave_config",scfg)) 
  `uvm_fatal(get_full_name,"CANNOT GET CONFIG FROM SDRV")

  sdrv_ap = new("sdrv_ap",this);

endfunction : build_phase

//========================Connect_phase()===============
 function void gpio_slave_driver::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
   vif = scfg.vif;
 endfunction : connect_phase

//========================Run Phase=====================
task gpio_slave_driver::run_phase(uvm_phase phase);
  super.run_phase(phase);
  forever
    begin
    seq_item_port.get_next_item(req);
    data_sent_to_master(req);
    seq_item_port.item_done();
  end
endtask : run_phase

//========================Data Send task======================
task gpio_slave_driver::data_sent_to_master(gpio_slave_transaction sdrv_xtn);

  foreach(sdrv_xtn.paddir[i]) begin
    if(sdrv_xtn.paddir[i]==1'b0) begin
      vif.GPn[i] = sdrv_xtn.padout[i];
    end
    else begin
      sdrv_xtn.padin[i] = vif.GPn[i];
    end
  end
  `uvm_info("SLAVE_DRIVER",$sformatf("Printing from SLAVE DRIVER \n %s", sdrv_xtn.sprint()),UVM_LOW)
  sdrv_ap.write(sdrv_xtn);	//Sent to Scoreboard

endtask : data_sent_to_master

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_slave_driver.sv,v $
//
//
///////////////////////////////////////////////////////////////////////////

