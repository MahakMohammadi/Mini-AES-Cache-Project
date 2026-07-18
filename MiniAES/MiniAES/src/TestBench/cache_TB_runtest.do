SetActiveLib -work
comp -include "$dsn\src\cache.vhd" 
comp -include "$dsn\src\TestBench\cache_TB.vhd" 
asim +access +r TESTBENCH_FOR_cache 
wave 
wave -noreg clk
wave -noreg rst
wave -noreg Address
wave -noreg DataIn
wave -noreg DataOut
wave -noreg hit
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\cache_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_cache 
