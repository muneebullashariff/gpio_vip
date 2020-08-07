//*************************************************************************************
//      The information contained in this file may not be copied
//           disseminated outside of MIRAFRA TECHNOLOGIES.
//              Copyright 2013 by  MIRAFRA TECHNOLOGIES.
//*************************************************************************************
//      Project Name  : PULPINO
//      File Name     : gpio_if.sv
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
`ifndef GPIO_IF_SV
`define GPIO_IF_SV

interface gpio_if(input bit clock);
   logic [31:0] GPn;
   logic [31:0] gpio_dir;
   logic [5:0][31:0] gpio_padcfg;
   logic  interrupt;

   //logic reset;

clocking MDRV@(posedge clock);
   default input #1 output #0;
     
     output GPn;
endclocking

clocking MMON@(posedge clock);
   default input #1 output #0;
	
    input gpio_dir;
    input gpio_padcfg;
    input interrupt;
    input GPn;
endclocking

clocking SMON@(posedge clock);
   default input #1 output #0;

   
    output gpio_padcfg;
    output interrupt;

endclocking

clocking SDRV@(posedge clock);
   default input #1 output #0;
     
     input GPn;
endclocking


modport MDRV_MP(input clock, clocking MDRV);
modport MMON_MP(input clock, clocking MMON);
modport SDRV_MP(input clock, clocking SDRV);
modport SMON_MP(input clock, clocking SMON);


endinterface

`endif


//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_if.sv,v $
//
///////////////////////////////////////////////////////////////////////////


