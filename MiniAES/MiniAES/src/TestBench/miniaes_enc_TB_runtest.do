SetActiveLib -work
comp -include "$dsn\src\MiniAES_Enc.vhd" 
comp -include "$dsn\src\TestBench\miniaes_enc_TB.vhd" 
asim +access +r TESTBENCH_FOR_miniaes_enc 
wave 
wave -noreg data_plain
wave -noreg data_enc
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\miniaes_enc_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_miniaes_enc 
