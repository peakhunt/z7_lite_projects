onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+z7_lite -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_11 -L processing_system7_vip_v1_0_13 -L xil_defaultlib -L xlconcat_v2_1_4 -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_mux_bit_v12_0_6 -L c_shift_ram_v12_0_14 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_17 -L cmpy_v6_0_20 -L floating_point_v7_0_19 -L xfft_v9_1_7 -L lib_pkg_v1_0_2 -L fifo_generator_v13_2_6 -L lib_fifo_v1_0_15 -L lib_srl_fifo_v1_0_2 -L lib_cdc_v1_0_2 -L axi_datamover_v5_1_27 -L axi_sg_v4_1_14 -L axi_dma_v7_1_26 -L generic_baseblocks_v2_1_0 -L axi_register_slice_v2_1_25 -L axi_data_fifo_v2_1_24 -L axi_crossbar_v2_1_26 -L proc_sys_reset_v5_0_13 -L axi_lite_ipif_v3_0_4 -L axi_fifo_mm_s_v4_2_7 -L axi_intc_v4_1_16 -L axi_timer_v2_0_27 -L blk_mem_gen_v8_4_5 -L lib_bmg_v1_0_14 -L axi_vdma_v6_3_13 -L v_tc_v6_1_13 -L v_vid_in_axi4s_v4_0_9 -L v_axi4s_vid_out_v4_0_13 -L v_tc_v6_2_3 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_27 -L axi_protocol_converter_v2_1_25 -L axi_clock_converter_v2_1_24 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.z7_lite xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {z7_lite.udo}

run -all

endsim

quit -force
