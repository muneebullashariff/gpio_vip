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
 uvm_tlm_analysis_fifo #(gpio_master_transaction) m_fifo;
 uvm_tlm_analysis_fifo #(gpio_slave_transaction) s_fifo;


 //========================gpio configuration handle==================================
  gpio_env_config env_cfg; 


 //=======================methods===================================
 extern function new(string name = "gpio_scoreboard",uvm_component parent);
 extern function void build_phase(uvm_phase phase);

 endclass

 //========================constructor=============================
  function gpio_scoreboard::new(string name = "gpio_scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction

 //========================Build_phase=============================
 function void gpio_scoreboard::build_phase(uvm_phase phase);
   super.build_phase(phase);
    
   if(!uvm_config_db #(gpio_env_config)::get(this,"","gpio_env_config",env_cfg))
    `uvm_fatal(get_full_name,"CANNOT GETCONFIGURATION FROM SB")

     m_fifo = new("m_fifo",this);
     s_fifo = new("s_fifo",this);

 endfunction


`endif

//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_scoreboard.sv,v $
//
///////////////////////////////////////////////////////////////////////////

