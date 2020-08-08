//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_scoreboard.sv
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
`ifndef GPIO_SCOREBOARD_SV
`define GPIO_SCOREBOARD_SV

class gpio_scoreboard extends uvm_scoreboard;

// Registering with UVM Factory
 `uvm_component_utils(gpio_scoreboard)


 //=======================declaring fifos for transactions===================================
 uvm_tlm_analysis_fifo #(gpio_master_transaction) m_fifo[2];
 uvm_tlm_analysis_fifo #(gpio_slave_transaction) s_fifo[2];

 //========================gpio configuration handle==================================
  gpio_env_config env_cfg; 

 //========================Transaction Handles==================================
 gpio_master_transaction	mdrv_xtn;
 gpio_master_transaction	mmon_xtn;
 gpio_slave_transaction		sdrv_xtn;
 gpio_slave_transaction		smon_xtn;

 //=======================methods===================================
 extern function new(string name = "gpio_scoreboard",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern task run_phase(uvm_phase phase);
 extern task comp;

 endclass

 //========================constructor=============================
  function gpio_scoreboard::new(string name = "gpio_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction

 //========================Build_phase=============================
 function void gpio_scoreboard::build_phase(uvm_phase phase);
   super.build_phase(phase);
    
   if(!uvm_config_db #(gpio_env_config)::get(this,"","gpio_env_config",env_cfg))
    `uvm_fatal(get_full_name,"CANNOT GET CONFIGURATION FROM SB")

   m_fifo[0] = new("m_fifo[0]",this);
   m_fifo[1] = new("m_fifo[1]",this);
   s_fifo[0] = new("s_fifo[0]",this);
   s_fifo[1] = new("s_fifo[1]",this);

    mdrv_xtn=gpio_master_transaction::type_id::create("mdrv_xtn");
    mmon_xtn=gpio_master_transaction::type_id::create("mmon_xtn");
    sdrv_xtn=gpio_slave_transaction::type_id::create("sdrv_xtn");
    smon_xtn=gpio_slave_transaction::type_id::create("smon_xtn");

 endfunction

  task gpio_scoreboard::run_phase(uvm_phase phase);
    forever begin
      comp();
    end
  endtask : run_phase

  task gpio_scoreboard::comp;

    m_fifo[0].get(mdrv_xtn);
    m_fifo[1].get(mmon_xtn);
    s_fifo[0].get(sdrv_xtn);
    s_fifo[1].get(smon_xtn);

//    `uvm_info("SCOREBOARD",$sformatf("Printing mdrv_xtn from SCOREBOARD \n %s",mdrv_xtn.sprint()),UVM_LOW)
//    `uvm_info("SCOREBOARD",$sformatf("Printing mmon_xtn from SCOREBOARD \n %s",mmon_xtn.sprint()),UVM_LOW)
//    `uvm_info("SCOREBOARD",$sformatf("Printing sdrv_xtn from SCOREBOARD \n %s",sdrv_xtn.sprint()),UVM_LOW)
//    `uvm_info("SCOREBOARD",$sformatf("Printing smon_xtn from SCOREBOARD \n %s",smon_xtn.sprint()),UVM_LOW)

//---------------------------COMPARISON(MDRV and SMON)-------------------------------
    foreach(mdrv_xtn.paddir[i]) begin
      if( i<'d16 && mdrv_xtn.paddir[i]==0) begin
        if(mdrv_xtn.padout[i]==smon_xtn.GPn[i]) begin
	  $display("MASTER DRIVER padout[%d]=%b SLAVE MONITOR GPn[%d]=%b\n***COMPARED OK***",i,mdrv_xtn.padout[i],i,smon_xtn.GPn[i]);
	end
	else begin
	  $display("MASTER DRIVER padout[%d]=%b SLAVE MONITOR GPn[%d]=%b\n***COMPARISON FAILED***",i,mdrv_xtn.padout[i],i,smon_xtn.GPn[i]);
	end
      end
    end

//---------------------------COMPARISON(SDRV and MMON)-------------------------------
    foreach(sdrv_xtn.paddir[i]) begin
      if( i<'d16 && sdrv_xtn.paddir[i]==0) begin
        if(sdrv_xtn.padout[i]==mmon_xtn.GPn[i]) begin
	  $display("SLAVE DRIVER padout[%d]=%b MASTER MONITOR GPn[%d]=%b\n***COMPARED OK***",i,sdrv_xtn.padout[i],i,mmon_xtn.GPn[i]);
	end
	else begin
	  $display("SLAVE DRIVER padout[%d]=%b MASTER MONITOR GPn[%d]=%b\n***COMPARISON FAILED***",i,sdrv_xtn.padout[i],i,mmon_xtn.GPn[i]);
	end
      end
    end

  endtask

`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_scoreboard.sv,v $
//
///////////////////////////////////////////////////////////////////////////

