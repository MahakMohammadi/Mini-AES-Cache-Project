SetActiveLib -work
comp -include "$dsn\src\SubBytes.vhd" 
comp -include "$dsn\src\TestBench\subbytes_TB.vhd" 
asim +access +r TESTBENCH_FOR_subbytes 
wave 
wave -noreg input
wave -noreg encrypt
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\subbytes_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_subbytes 
