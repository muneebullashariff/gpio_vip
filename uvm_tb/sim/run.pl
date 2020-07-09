#!usr/bin/perl

# Please uncomment what is required.
#system "/bin/csh";
system "source /pdtools/synosys/source/source.sh";
#for compilation and simulation in Synopsys VCS
system " vcs -V -R -full64 -sverilog +v2k -gui -debug_access+all -ntb_opts ../gpio_env/gpio_package.sv ../gpio_top/gpio_top.sv ";

#system "vlib work";
#system "vmap work work";

#for compilation in Mentor QuestaSim
#system "vlog -work work -sv +incdir+../source/master +incdir+../source/slave +incdir+../source/tb +incdir+../source/test ../source/test/test_pkg.sv ../source/tb/top.sv";

#for simulation in Mentor QuestaSim
#system "vsim -voptargs=\"+acc=rnb\" -l ral_sim.log +UVM_VERBOSITY=UVM_HIGH -novopt top -c -do \"log -r /*; add wave -r /*; run -all;\" +UVM_TESTNAME=test -wlf waveform.wlf";

# +acc=rnb 
# Compile my design so that all of it has:
# registers (r)
# nets (n)
# vector bits (b)
# Visible so that backdoor access will work correctly
