//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_master_monitor.sv
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
`ifndef GPIO_MASTER_MONITOR_SV
`define GPIO_MASTER_MONITOR_SV

 class gpio_master_monitor extends uvm_monitor;

// Registering with UVM Factory
 `uvm_component_utils(gpio_master_monitor)

 virtual gpio_if vif;

 gpio_master_config mcfg;

 gpio_master_transaction mxtn;

 uvm_analysis_port #(gpio_master_transaction) mmon_ap;

 //=======================methods===================================
 extern function new(string name = "gpio_master_monitor",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);
 extern task run_phase (uvm_phase phase);
 extern task collect_data();
 endclass

 //========================constructor=============================
 function gpio_master_monitor::new(string name = "gpio_master_monitor",uvm_component parent);
  super.new(name,parent);
  mmon_ap = new("mmon_ap",this);
 endfunction


 //========================Build_phase=============================
 function void gpio_master_monitor::build_phase(uvm_phase phase);
  super.build_phase(phase);
  
  if(!uvm_config_db #(gpio_master_config)::get(this,"","gpio_master_config",mcfg))
   `uvm_fatal(get_full_name,"CANNOT GET MCFG FROM MASTER IN MMON"); 

endfunction

//========================Connect_phase()===============
 function void gpio_master_monitor::connect_phase(uvm_phase phase);
 super.connect_phase(phase);
  vif = mcfg.vif;
 endfunction

//========================== run_phase ==================

task gpio_master_monitor::run_phase(uvm_phase phase);

begin @(posedge vif.clock)
collect_data();
end
endtask

//=========================Collect data==================
task gpio_master_monitor::collect_data();
  gpio_master_transaction mmon_xtn;
  mmon_xtn=gpio_master_transaction::type_id::create("mmon_xtn");

  mmon_xtn.padin[15:8] = vif.GPn[15:8];
  mmon_xtn.GPn = mmon_xtn.padin;
  `uvm_info("MASTER_MONITOR",$sformatf("printing from MASTER MoNiToR \n %s", mmon_xtn.sprint()),UVM_LOW) 
  mmon_ap.write(mmon_xtn);	//Sent to Scoreboard
endtask : collect_data
`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_master_monitor.sv,v $
//
///////////////////////////////////////////////////////////////////////////

