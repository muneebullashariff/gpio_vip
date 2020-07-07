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
   logic [31:0] gpio_in;
   logic [31:0] gpio_out;
   logic [31:0] gpio_dir;
   logic [5:0][31:0] gpio_padcfg;
   logic  interrupt;

   //NEED TO CHECK WHICH RESET SHOULD USE
   //logic reset;

clocking MDRV@(posedge clock);
   default input #1 output #0;
     
     output gpio_in;

//$display("FROM INTERFACE gpio_in=%d",gpio_in);
endclocking

clocking MMON@(negedge clock);
   default input #1 output #0;
	
    input gpio_out;
    input gpio_dir;
    input gpio_padcfg;
    input interrupt;

endclocking

clocking SMON@(negedge clock);
   default input #1 output #0;

    output gpio_out;
    output gpio_dir;
    output gpio_padcfg;
    output interrupt;

endclocking

clocking SDRV@(posedge clock);
   default input #1 output #0;
     
     input gpio_in;

endclocking

modport MDRV_MP(clocking MDRV);

//$display("FROM MASTER DRIVER INTERACE gpio_in=%d",gpio_in);

modport MMON_MP(clocking MMON);
modport SDRV_MP(clocking SDRV);
modport SMON_MP(clocking SMON);

endinterface

`endif


//----------------------- End of file -----------------------------------//
///////////////////////////////////////////////////////////////////////////
// Modification History:
// $Log: gpio_if.sv,v $
//
///////////////////////////////////////////////////////////////////////////


