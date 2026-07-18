SetActiveLib -work
comp -include "$dsn\src\MiniAES_Dec.vhd" 
comp -include "$dsn\src\TestBench\miniaes_dec_TB.vhd" 
asim +access +r TESTBENCH_FOR_miniaes_dec 
wave 
wave -noreg data_enc
wave -noreg data_plain
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\miniaes_dec_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_miniaes_dec 
