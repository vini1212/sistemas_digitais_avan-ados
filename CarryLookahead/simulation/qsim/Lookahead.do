onerror {quit -f}
vlib work
vlog -work work Lookahead.vo
vlog -work work Lookahead.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Lookahead_vlg_vec_tst
vcd file -direction Lookahead.msim.vcd
vcd add -internal Lookahead_vlg_vec_tst/*
vcd add -internal Lookahead_vlg_vec_tst/i1/*
add wave /*
run -all
