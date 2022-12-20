//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Mon Dec 19 16:26:13 2022
//Host        : DESKTOP-PN0338N running 64-bit major release  (build 9200)
//Command     : generate_target z7_lite_wrapper.bd
//Design      : z7_lite_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module z7_lite_wrapper
   (AXI_GPIO_tri_io,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    EMIO_GPIO_tri_io,
    ENET0_GMII_RXD,
    ENET0_GMII_RX_CLK_0,
    ENET0_GMII_RX_DV_0,
    ENET0_GMII_TXD,
    ENET0_GMII_TX_CLK_0,
    ENET0_GMII_TX_EN_0,
    ETH_RESET,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    IIC_0_0_scl_io,
    IIC_0_0_sda_io,
    MDIO_ETHERNET_0_0_mdc,
    MDIO_ETHERNET_0_0_mdio_io,
    TMDS_0_clk_n,
    TMDS_0_clk_p,
    TMDS_0_data_n,
    TMDS_0_data_p);
  inout [1:0]AXI_GPIO_tri_io;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout [1:0]EMIO_GPIO_tri_io;
  input [3:0]ENET0_GMII_RXD;
  input ENET0_GMII_RX_CLK_0;
  input ENET0_GMII_RX_DV_0;
  output [3:0]ENET0_GMII_TXD;
  input ENET0_GMII_TX_CLK_0;
  output [0:0]ENET0_GMII_TX_EN_0;
  output ETH_RESET;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  inout IIC_0_0_scl_io;
  inout IIC_0_0_sda_io;
  output MDIO_ETHERNET_0_0_mdc;
  inout MDIO_ETHERNET_0_0_mdio_io;
  output TMDS_0_clk_n;
  output TMDS_0_clk_p;
  output [2:0]TMDS_0_data_n;
  output [2:0]TMDS_0_data_p;

  wire [0:0]AXI_GPIO_tri_i_0;
  wire [1:1]AXI_GPIO_tri_i_1;
  wire [0:0]AXI_GPIO_tri_io_0;
  wire [1:1]AXI_GPIO_tri_io_1;
  wire [0:0]AXI_GPIO_tri_o_0;
  wire [1:1]AXI_GPIO_tri_o_1;
  wire [0:0]AXI_GPIO_tri_t_0;
  wire [1:1]AXI_GPIO_tri_t_1;
  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire [0:0]EMIO_GPIO_tri_i_0;
  wire [1:1]EMIO_GPIO_tri_i_1;
  wire [0:0]EMIO_GPIO_tri_io_0;
  wire [1:1]EMIO_GPIO_tri_io_1;
  wire [0:0]EMIO_GPIO_tri_o_0;
  wire [1:1]EMIO_GPIO_tri_o_1;
  wire [0:0]EMIO_GPIO_tri_t_0;
  wire [1:1]EMIO_GPIO_tri_t_1;
  wire [3:0]ENET0_GMII_RXD;
  wire ENET0_GMII_RX_CLK_0;
  wire ENET0_GMII_RX_DV_0;
  wire [3:0]ENET0_GMII_TXD;
  wire ENET0_GMII_TX_CLK_0;
  wire [0:0]ENET0_GMII_TX_EN_0;
  wire ETH_RESET;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire IIC_0_0_scl_i;
  wire IIC_0_0_scl_io;
  wire IIC_0_0_scl_o;
  wire IIC_0_0_scl_t;
  wire IIC_0_0_sda_i;
  wire IIC_0_0_sda_io;
  wire IIC_0_0_sda_o;
  wire IIC_0_0_sda_t;
  wire MDIO_ETHERNET_0_0_mdc;
  wire MDIO_ETHERNET_0_0_mdio_i;
  wire MDIO_ETHERNET_0_0_mdio_io;
  wire MDIO_ETHERNET_0_0_mdio_o;
  wire MDIO_ETHERNET_0_0_mdio_t;
  wire TMDS_0_clk_n;
  wire TMDS_0_clk_p;
  wire [2:0]TMDS_0_data_n;
  wire [2:0]TMDS_0_data_p;

  IOBUF AXI_GPIO_tri_iobuf_0
       (.I(AXI_GPIO_tri_o_0),
        .IO(AXI_GPIO_tri_io[0]),
        .O(AXI_GPIO_tri_i_0),
        .T(AXI_GPIO_tri_t_0));
  IOBUF AXI_GPIO_tri_iobuf_1
       (.I(AXI_GPIO_tri_o_1),
        .IO(AXI_GPIO_tri_io[1]),
        .O(AXI_GPIO_tri_i_1),
        .T(AXI_GPIO_tri_t_1));
  IOBUF EMIO_GPIO_tri_iobuf_0
       (.I(EMIO_GPIO_tri_o_0),
        .IO(EMIO_GPIO_tri_io[0]),
        .O(EMIO_GPIO_tri_i_0),
        .T(EMIO_GPIO_tri_t_0));
  IOBUF EMIO_GPIO_tri_iobuf_1
       (.I(EMIO_GPIO_tri_o_1),
        .IO(EMIO_GPIO_tri_io[1]),
        .O(EMIO_GPIO_tri_i_1),
        .T(EMIO_GPIO_tri_t_1));
  IOBUF IIC_0_0_scl_iobuf
       (.I(IIC_0_0_scl_o),
        .IO(IIC_0_0_scl_io),
        .O(IIC_0_0_scl_i),
        .T(IIC_0_0_scl_t));
  IOBUF IIC_0_0_sda_iobuf
       (.I(IIC_0_0_sda_o),
        .IO(IIC_0_0_sda_io),
        .O(IIC_0_0_sda_i),
        .T(IIC_0_0_sda_t));
  IOBUF MDIO_ETHERNET_0_0_mdio_iobuf
       (.I(MDIO_ETHERNET_0_0_mdio_o),
        .IO(MDIO_ETHERNET_0_0_mdio_io),
        .O(MDIO_ETHERNET_0_0_mdio_i),
        .T(MDIO_ETHERNET_0_0_mdio_t));
  z7_lite z7_lite_i
       (.AXI_GPIO_tri_i({AXI_GPIO_tri_i_1,AXI_GPIO_tri_i_0}),
        .AXI_GPIO_tri_o({AXI_GPIO_tri_o_1,AXI_GPIO_tri_o_0}),
        .AXI_GPIO_tri_t({AXI_GPIO_tri_t_1,AXI_GPIO_tri_t_0}),
        .DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .EMIO_GPIO_tri_i({EMIO_GPIO_tri_i_1,EMIO_GPIO_tri_i_0}),
        .EMIO_GPIO_tri_o({EMIO_GPIO_tri_o_1,EMIO_GPIO_tri_o_0}),
        .EMIO_GPIO_tri_t({EMIO_GPIO_tri_t_1,EMIO_GPIO_tri_t_0}),
        .ENET0_GMII_RXD(ENET0_GMII_RXD),
        .ENET0_GMII_RX_CLK_0(ENET0_GMII_RX_CLK_0),
        .ENET0_GMII_RX_DV_0(ENET0_GMII_RX_DV_0),
        .ENET0_GMII_TXD(ENET0_GMII_TXD),
        .ENET0_GMII_TX_CLK_0(ENET0_GMII_TX_CLK_0),
        .ENET0_GMII_TX_EN_0(ENET0_GMII_TX_EN_0),
        .ETH_RESET(ETH_RESET),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .IIC_0_0_scl_i(IIC_0_0_scl_i),
        .IIC_0_0_scl_o(IIC_0_0_scl_o),
        .IIC_0_0_scl_t(IIC_0_0_scl_t),
        .IIC_0_0_sda_i(IIC_0_0_sda_i),
        .IIC_0_0_sda_o(IIC_0_0_sda_o),
        .IIC_0_0_sda_t(IIC_0_0_sda_t),
        .MDIO_ETHERNET_0_0_mdc(MDIO_ETHERNET_0_0_mdc),
        .MDIO_ETHERNET_0_0_mdio_i(MDIO_ETHERNET_0_0_mdio_i),
        .MDIO_ETHERNET_0_0_mdio_o(MDIO_ETHERNET_0_0_mdio_o),
        .MDIO_ETHERNET_0_0_mdio_t(MDIO_ETHERNET_0_0_mdio_t),
        .TMDS_0_clk_n(TMDS_0_clk_n),
        .TMDS_0_clk_p(TMDS_0_clk_p),
        .TMDS_0_data_n(TMDS_0_data_n),
        .TMDS_0_data_p(TMDS_0_data_p));
endmodule
