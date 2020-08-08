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

 virtual gpio_if vif;

 uvm_analysis_port #(gpio_master_transaction) mdrv_ap;
 
 //=======================methods===================================
 extern function new(string name = "gpio_master_driver",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);
 extern task data_sent_to_dut(gpio_master_transaction mdrv_xtn);
 
 endclass : gpio_master_driver

 //========================constructor=============================
  function gpio_master_driver::new(string name="gpio_master_driver",uvm_component parent);
   super.new(name,parent);
  endfunction : new

 //========================Build_phase=============================
 function void gpio_master_driver::build_phase(uvm_phase phase);
  super.build_phase(phase);
 
 if(!uvm_config_db #(gpio_master_config)::get(this,"","gpio_master_config",mcfg)) 
  `uvm_fatal(get_full_name,"CANNOT GET CONFIG FROM MDRV")

  mdrv_ap = new("mdrv_ap",this);

endfunction : build_phase

//========================Connect_phase()===============
 function void gpio_master_driver::connect_phase(uvm_phase phase);
   super.connect_phase(phase);
    vif = mcfg.vif;
 endfunction : connect_phase

//========================Run Phase=====================
task gpio_master_driver::run_phase(uvm_phase phase);
  super.run_phase(phase);
    forever
   begin
   seq_item_port.get_next_item(req);
   data_sent_to_dut(req);
   seq_item_port.item_done();
  end
 endtask : run_phase

//=======================Data Send task=================
task gpio_master_driver::data_sent_to_dut(gpio_master_transaction mdrv_xtn);

  foreach(mdrv_xtn.paddir[i]) begin
    if(mdrv_xtn.paddir[i]==1'b0) begin
      vif.GPn[i] = mdrv_xtn.padout[i];
    end
    else begin
      mdrv_xtn.padin[i] = vif.GPn[i];
    end
  end
  mdrv_ap.write(mdrv_xtn);	//Sent to Scoreboard
  `uvm_info("MASTER_DRIVER",$sformatf("Printing from MASTER DRIVER \n %s", mdrv_xtn.sprint()),UVM_LOW) 

endtask : data_sent_to_dut


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_driver.sv,v $
//
///////////////////////////////////////////////////////////////////////////

