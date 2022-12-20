-makelib xcelium_lib/xilinx_vip -sv \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "C:/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_11 -sv \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/processing_system7_vip_v1_0_13 -sv \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/3007/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_processing_system7_0_0/sim/z7_lite_processing_system7_0_0.v" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_4 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_xlconcat_0_0/sim/z7_lite_xlconcat_0_0.v" \
  "../../../bd/z7_lite/ip/z7_lite_xlconcat_1_0/sim/z7_lite_xlconcat_1_0.v" \
-endlib
-makelib xcelium_lib/xbip_utils_v3_0_10 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/364f/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_utils_v2_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_reg_fd_v12_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_pipe_v3_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_addsub_v3_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_addsub_v12_0_14 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_mux_bit_v12_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ecb4/hdl/c_mux_bit_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/c_shift_ram_v12_0_14 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/2598/hdl/c_shift_ram_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xbip_bram18k_v3_0_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/mult_gen_v12_0_17 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/dd36/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/cmpy_v6_0_20 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/328f/hdl/cmpy_v6_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/floating_point_v7_0_19 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/08ac/hdl/floating_point_v7_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xfft_v9_1_7 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/b7d6/hdl/xfft_v9_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_xfft_0_0/sim/z7_lite_xfft_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/8ae1/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_15 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/a4ed/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_datamover_v5_1_27 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/9b19/hdl/axi_datamover_v5_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_sg_v4_1_14 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/bcf6/hdl/axi_sg_v4_1_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_dma_v7_1_26 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/69a4/hdl/axi_dma_v7_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_dma_0_0/sim/z7_lite_axi_dma_0_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_25 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/e1e6/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_24 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/fa53/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_26 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ac57/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_xbar_1/sim/z7_lite_xbar_1.v" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_rst_ps7_0_150M_0/sim/z7_lite_rst_ps7_0_150M_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_xbar_0/sim/z7_lite_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_fifo_mm_s_v4_2_7 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/7665/hdl/axi_fifo_mm_s_v4_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_fifo_mm_s_0_0/sim/z7_lite_axi_fifo_mm_s_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_intc_v4_1_16 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/0b29/hdl/axi_intc_v4_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_intc_0_0/sim/z7_lite_axi_intc_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_xlconcat_2_0/sim/z7_lite_xlconcat_2_0.v" \
-endlib
-makelib xcelium_lib/axi_timer_v2_0_27 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/6c6b/hdl/axi_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_timer_0_0/sim/z7_lite_axi_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/lib_bmg_v1_0_14 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/3a3e/hdl/lib_bmg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_13 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/36fa/hdl/axi_vdma_v6_3_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vdma_v6_3_13 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/36fa/hdl/axi_vdma_v6_3_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_vdma_0_0/sim/z7_lite_axi_vdma_0_0.vhd" \
-endlib
-makelib xcelium_lib/v_tc_v6_1_13 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/b92e/hdl/v_tc_v6_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/v_vid_in_axi4s_v4_0_9 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/b2aa/hdl/v_vid_in_axi4s_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/v_axi4s_vid_out_v4_0_13 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/da0d/hdl/v_axi4s_vid_out_v4_0_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_v_axi4s_vid_out_0_0/sim/z7_lite_v_axi4s_vid_out_0_0.v" \
-endlib
-makelib xcelium_lib/v_tc_v6_2_3 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ee1d/hdl/v_tc_v6_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_v_tc_0_0/sim/z7_lite_v_tc_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/9097/src/mmcme2_drp.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/9097/src/axi_dynclk_S00_AXI.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/9097/src/axi_dynclk.vhd" \
  "../../../bd/z7_lite/ip/z7_lite_axi_dynclk_0_0/sim/z7_lite_axi_dynclk_0_0.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/ClockGen.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/SyncAsync.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/SyncAsyncReset.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/DVI_Constants.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/OutputSERDES.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/TMDS_Encoder.vhd" \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/ca91/src/rgb2dvi.vhd" \
  "../../../bd/z7_lite/ip/z7_lite_rgb2dvi_0_0/sim/z7_lite_rgb2dvi_0_0.vhd" \
  "../../../bd/z7_lite/ip/z7_lite_proc_sys_reset_0_0/sim/z7_lite_proc_sys_reset_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/sim/z7_lite.v" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_27 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/a5bb/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_axi_gpio_0_0/sim/z7_lite_axi_gpio_0_0.vhd" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_25 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/8fe4/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_auto_pc_0/sim/z7_lite_auto_pc_0.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_24 \
  "../../../../z7_lite_linux.gen/sources_1/bd/z7_lite/ipshared/23c0/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/z7_lite/ip/z7_lite_auto_cc_0/sim/z7_lite_auto_cc_0.v" \
  "../../../bd/z7_lite/ip/z7_lite_auto_cc_1/sim/z7_lite_auto_cc_1.v" \
  "../../../bd/z7_lite/ip/z7_lite_auto_cc_2/sim/z7_lite_auto_cc_2.v" \
  "../../../bd/z7_lite/ip/z7_lite_auto_cc_3/sim/z7_lite_auto_cc_3.v" \
  "../../../bd/z7_lite/ip/z7_lite_auto_pc_1/sim/z7_lite_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

