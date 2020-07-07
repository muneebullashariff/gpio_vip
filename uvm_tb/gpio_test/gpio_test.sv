//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_test.sv
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
`ifndef GPIO_TEST_SV
`define GPIO_TEST_SV


class gpio_test extends uvm_test;

// Registering with UVM Factory
 `uvm_component_utils(gpio_test)

 //======================declaring env handle=======================
 gpio_env env;
 
 //======================declaring env config handle=======================
 gpio_env_config env_cfg;


 //======================declaring master config handle=======================
 gpio_master_config mcfg;
 
 
 //======================declaring slave config handle=======================
 gpio_slave_config scfg;


 int has_magt=1;
 int has_sagt=1;
 
 //=======================methods===================================
 extern function new(string name = "gpio_test",uvm_component parent);
 extern function void build_phase(uvm_phase phase);
 extern function void start_of_simulation_phase(uvm_phase phase);
 endclass

 //========================constructor=============================
 function gpio_test::new(string name = "gpio_test",uvm_component parent);
  super.new(name,parent);
 endfunction


 //========================Build_phase=============================
 function void gpio_test::build_phase(uvm_phase phase);
   super.build_phase(phase);
   
      env_cfg = gpio_env_config::type_id::create("gpio_env_config",this);
	
 
       if(has_magt)
        begin
         mcfg = gpio_master_config::type_id::create("mcfg",this);
	 if(!uvm_config_db #(virtual gpio_if)::get(this,"","vif",mcfg.vif))
        `uvm_fatal(get_full_name,"CANNOT GET INTERFACE FOR MCFG FROM TEST")
	 mcfg.is_active = UVM_ACTIVE;	 
       end

       if(has_sagt)
        begin
         scfg = gpio_slave_config::type_id::create("scfg",this);
	 if(!uvm_config_db #(virtual gpio_if)::get(this,"","vif",scfg.vif))
        `uvm_fatal(get_full_name,"CANNOT GET INTERFACE FOR SCFG FROM TEST")
	 scfg.is_active = UVM_ACTIVE;	 
        end

     
     env_cfg.mcfg = mcfg;
     env_cfg.scfg = scfg;

     env_cfg.has_magt = has_magt;
     env_cfg.has_sagt = has_sagt;

	uvm_config_db #(gpio_env_config)::set(this,"*","gpio_env_config",env_cfg);

      env = gpio_env::type_id::create("gpio_env",this);

endfunction 

//========================start_of_simulation_phase()===============
 function void gpio_test::start_of_simulation_phase(uvm_phase phase);
  
   uvm_top.print_topology();

 endfunction



`endif


//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_test.sv,v $
//
///////////////////////////////////////////////////////////////////////////

