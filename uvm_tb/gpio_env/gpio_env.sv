//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_env.sv
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
`ifndef GPIO_ENV_SV
`define GPIO_ENV_SV

class gpio_env extends uvm_env;

 // Registering with UVM Factory
 `uvm_component_utils(gpio_env)


 //========================gpio master and slave handles==================================
 gpio_master_agent magt;
 gpio_slave_agent sagt;


 //=======================virtual sequencer declaration===================================
gpio_virtual_sequencer v_seqr;


 //=======================gpio scoreboard declaration===================================
 gpio_scoreboard sb;


 //=======================gpio environment config handle===================================
 gpio_env_config env_cfg;


 //=======================gpio master agent config handle===================================
 gpio_master_config mcfg;


 //=======================gpio slave agent config handle===================================
 gpio_slave_config scfg;
 

 //=======================methods===================================
 extern function new(string name = "gpio_env",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void connect_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
  function gpio_env::new(string name = "gpio_env",uvm_component parent);
    super.new(name,parent);
  endfunction

 //========================Build_phase=============================
 function void gpio_env::build_phase(uvm_phase phase);
   super.build_phase(phase);

	if(!uvm_config_db #(gpio_env_config)::get(this,"","gpio_env_config",env_cfg))
	`uvm_fatal(get_full_name,"NOT GETTING FROM ENV")

	if(env_cfg.has_magt)
        begin
	   uvm_config_db #(gpio_master_config)::set(this,"*","gpio_master_config",env_cfg.mcfg);
           magt = gpio_master_agent::type_id::create("magt",this);
	end

	if(env_cfg.has_sagt)
    	begin
         uvm_config_db #(gpio_slave_config)::set(this,"*","gpio_slave_config",env_cfg.scfg);
	 sagt = gpio_slave_agent::type_id::create("sagt",this);
	end

	if(env_cfg.has_scoreboard)
 	begin
	 sb = gpio_scoreboard::type_id::create("sb",this);
	end

	if(env_cfg.has_virtual_sequencer)
	begin
	 v_seqr = gpio_virtual_sequencer::type_id::create("v_seqr",this);
	end
 endfunction


//========================Connect_phase()===============
 function void gpio_env::connect_phase(uvm_phase phase);
  super.connect_phase(phase);
   if(env_cfg.has_virtual_sequencer)
   begin
    
    if(env_cfg.has_magt)
     v_seqr.m_seqr = magt.mseqr;
    
//   if(env_cfg.has_sagt)
//     v_seqr.s_seqr = sagt.sseqr;  
   

  if(env_cfg.has_scoreboard)
   begin
    magt.mdrv.mdrv_ap.connect(sb.m_fifo[0].analysis_export);
    magt.mmon.mmon_ap.connect(sb.m_fifo[1].analysis_export);
    sagt.sdrv.sdrv_ap.connect(sb.s_fifo[0].analysis_export);
    sagt.smon.smon_ap.connect(sb.s_fifo[1].analysis_export);
   end
   

  end
 
endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_env.sv,v $
//
///////////////////////////////////////////////////////////////////////////

