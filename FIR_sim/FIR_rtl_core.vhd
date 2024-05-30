-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.0 (Release Build #614)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from FIR_rtl_core
-- VHDL created on Tue May 28 23:25:22 2024


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity FIR_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(29 downto 0);  -- sfix30
        clk : in std_logic;
        areset : in std_logic
    );
end FIR_rtl_core;

architecture normal of FIR_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_xIn_0_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_in0_m0_wi0_wo0_assign_id1_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_count : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_run_preEnaQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_out : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_enableQ : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_run_ctrl : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_memread_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_compute_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_13_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_20_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_q : STD_LOGIC_VECTOR (2 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_i : UNSIGNED (2 downto 0);
    attribute preserve : boolean;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_ra0_count0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_ra0_count0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_q : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_wa0_i : UNSIGNED (1 downto 0);
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_i : signal is true;
    signal u0_m0_wo0_wi0_r0_wa0_eq : std_logic;
    attribute preserve of u0_m0_wo0_wi0_r0_wa0_eq : signal is true;
    signal u0_m0_wo0_wi0_r0_memr0_reset0 : std_logic;
    signal u0_m0_wo0_wi0_r0_memr0_ia : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_aa : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_ab : STD_LOGIC_VECTOR (1 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_iq : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_memr0_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_memr0_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr20_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr21_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr22_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr23_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr24_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr25_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_ca25_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_ca25_i : UNSIGNED (0 downto 0);
    attribute preserve of u0_m0_wo0_ca25_i : signal is true;
    signal d_u0_m0_wo0_ca25_q_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_cm0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm3_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm5_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm8_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm9_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm11_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm12_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm13_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm14_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm15_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm16_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm17_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm18_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm19_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm20_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm21_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm22_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm23_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm24_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_cm25_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_25_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_24_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_23_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_22_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_22_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_21_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_20_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_19_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_18_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_17_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_16_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_15_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_14_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_14_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_13_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_12_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_11_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_10_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_10_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_9_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_8_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_7_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_6_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_6_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_5_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_4_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_3_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_2_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_2_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_1_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_a0 : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_b0 : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_s1 : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_reset : std_logic;
    signal u0_m0_wo0_mtree_mult1_0_q : STD_LOGIC_VECTOR (23 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_1_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_1_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_1_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_1_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_3_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_5_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_5_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_5_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_5_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_7_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_10_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_10_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_10_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_10_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_11_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_11_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_11_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_11_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_12_a : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_12_b : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_12_o : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add0_12_q : STD_LOGIC_VECTOR (24 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_5_a : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_5_b : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_5_o : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add1_5_q : STD_LOGIC_VECTOR (25 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_a : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_b : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_o : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add2_2_q : STD_LOGIC_VECTOR (26 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_a : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_b : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_o : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add3_1_q : STD_LOGIC_VECTOR (27 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : STD_LOGIC_VECTOR (28 downto 0);
    signal u0_m0_wo0_aseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_aseq_eq : std_logic;
    signal u0_m0_wo0_accum_a : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_b : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_i : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_o : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_accum_q : STD_LOGIC_VECTOR (29 downto 0);
    signal u0_m0_wo0_oseq_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_eq : std_logic;
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_oseq_gated_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_wi0_r0_ra0_count0_lut_q : STD_LOGIC_VECTOR (1 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- u0_m0_wo0_run(ENABLEGENERATOR,13)@10 + 2
    u0_m0_wo0_run_ctrl <= u0_m0_wo0_run_out & xIn_v & u0_m0_wo0_run_enableQ;
    u0_m0_wo0_run_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_run_enable_c : SIGNED(0 downto 0);
        variable u0_m0_wo0_run_inc : SIGNED(1 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_run_q <= "0";
            u0_m0_wo0_run_enable_c := TO_SIGNED(0, 1);
            u0_m0_wo0_run_enableQ <= "0";
            u0_m0_wo0_run_count <= "00";
            u0_m0_wo0_run_inc := (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_run_out = "1") THEN
                IF (u0_m0_wo0_run_enable_c(0) = '1') THEN
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c - (-1);
                ELSE
                    u0_m0_wo0_run_enable_c := u0_m0_wo0_run_enable_c + (-1);
                END IF;
                u0_m0_wo0_run_enableQ <= STD_LOGIC_VECTOR(u0_m0_wo0_run_enable_c(0 downto 0));
            ELSE
                u0_m0_wo0_run_enableQ <= "0";
            END IF;
            CASE (u0_m0_wo0_run_ctrl) IS
                WHEN "000" | "001" => u0_m0_wo0_run_inc := "00";
                WHEN "010" | "011" => u0_m0_wo0_run_inc := "11";
                WHEN "100" => u0_m0_wo0_run_inc := "00";
                WHEN "101" => u0_m0_wo0_run_inc := "01";
                WHEN "110" => u0_m0_wo0_run_inc := "11";
                WHEN "111" => u0_m0_wo0_run_inc := "00";
                WHEN OTHERS => 
            END CASE;
            u0_m0_wo0_run_count <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_run_count) + SIGNED(u0_m0_wo0_run_inc));
            u0_m0_wo0_run_q <= u0_m0_wo0_run_out;
        END IF;
    END PROCESS;
    u0_m0_wo0_run_preEnaQ <= u0_m0_wo0_run_count(1 downto 1);
    u0_m0_wo0_run_out <= u0_m0_wo0_run_preEnaQ and VCC_q;

    -- u0_m0_wo0_memread(DELAY,14)@12
    u0_m0_wo0_memread : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_run_q, xout => u0_m0_wo0_memread_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_compute(DELAY,16)@12
    u0_m0_wo0_compute : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => u0_m0_wo0_compute_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_13(DELAY,143)@12 + 1
    d_u0_m0_wo0_compute_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_compute_q, xout => d_u0_m0_wo0_compute_q_13_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_19(DELAY,144)@13 + 6
    d_u0_m0_wo0_compute_q_19 : dspba_delay
    GENERIC MAP ( width => 1, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_13_q, xout => d_u0_m0_wo0_compute_q_19_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_aseq(SEQUENCE,130)@19 + 1
    u0_m0_wo0_aseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_aseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_aseq_c := "0000";
            u0_m0_wo0_aseq_q <= "0";
            u0_m0_wo0_aseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_aseq_c = "0000") THEN
                    u0_m0_wo0_aseq_eq <= '1';
                ELSE
                    u0_m0_wo0_aseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_aseq_eq = '1') THEN
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c + 1;
                ELSE
                    u0_m0_wo0_aseq_c := u0_m0_wo0_aseq_c - 1;
                END IF;
                u0_m0_wo0_aseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_aseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- d_u0_m0_wo0_compute_q_20(DELAY,145)@19 + 1
    d_u0_m0_wo0_compute_q_20 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_19_q, xout => d_u0_m0_wo0_compute_q_20_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_memread_q_13(DELAY,142)@12 + 1
    d_u0_m0_wo0_memread_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_memread_q, xout => d_u0_m0_wo0_memread_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_ra0_count0(COUNTER,21)@13
    -- low=0, high=5, step=1, init=1
    u0_m0_wo0_wi0_r0_ra0_count0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_i <= TO_UNSIGNED(1, 3);
            u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_ra0_count0_i = TO_UNSIGNED(4, 3)) THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_ra0_count0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 3;
                ELSE
                    u0_m0_wo0_wi0_r0_ra0_count0_i <= u0_m0_wo0_wi0_r0_ra0_count0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_ra0_count0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_ra0_count0_i, 3)));

    -- u0_m0_wo0_wi0_r0_ra0_count0_lut(LOOKUP,19)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lut_combproc: PROCESS (u0_m0_wo0_wi0_r0_ra0_count0_q)
    BEGIN
        -- Begin reserved scope level
        CASE (u0_m0_wo0_wi0_r0_ra0_count0_q) IS
            WHEN "000" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN "001" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "010" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "01";
            WHEN "011" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "100" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "10";
            WHEN "101" => u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= "00";
            WHEN OTHERS => -- unreachable
                           u0_m0_wo0_wi0_r0_ra0_count0_lut_q <= (others => '-');
        END CASE;
        -- End reserved scope level
    END PROCESS;

    -- u0_m0_wo0_wi0_r0_ra0_count0_lutreg(REG,20)@13
    u0_m0_wo0_wi0_r0_ra0_count0_lutreg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= "00";
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_memread_q_13_q = "1") THEN
                u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_ra0_count0_lut_q);
            END IF;
        END IF;
    END PROCESS;

    -- d_xIn_0_13(DELAY,140)@10 + 3
    d_xIn_0_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_xIn_0_13_q, clk => clk, aclr => areset );

    -- d_in0_m0_wi0_wo0_assign_id1_q_13(DELAY,141)@10 + 3
    d_in0_m0_wi0_wo0_assign_id1_q_13 : dspba_delay
    GENERIC MAP ( width => 1, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_in0_m0_wi0_wo0_assign_id1_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_wa0(COUNTER,22)@13
    -- low=0, high=2, step=1, init=1
    u0_m0_wo0_wi0_r0_wa0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_wi0_r0_wa0_i <= TO_UNSIGNED(1, 2);
            u0_m0_wo0_wi0_r0_wa0_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_in0_m0_wi0_wo0_assign_id1_q_13_q = "1") THEN
                IF (u0_m0_wo0_wi0_r0_wa0_i = TO_UNSIGNED(1, 2)) THEN
                    u0_m0_wo0_wi0_r0_wa0_eq <= '1';
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_eq <= '0';
                END IF;
                IF (u0_m0_wo0_wi0_r0_wa0_eq = '1') THEN
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 2;
                ELSE
                    u0_m0_wo0_wi0_r0_wa0_i <= u0_m0_wo0_wi0_r0_wa0_i + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_wi0_r0_wa0_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_wi0_r0_wa0_i, 2)));

    -- u0_m0_wo0_wi0_r0_memr0(DUALMEM,23)@13
    u0_m0_wo0_wi0_r0_memr0_ia <= STD_LOGIC_VECTOR(d_xIn_0_13_q);
    u0_m0_wo0_wi0_r0_memr0_aa <= u0_m0_wo0_wi0_r0_wa0_q;
    u0_m0_wo0_wi0_r0_memr0_ab <= u0_m0_wo0_wi0_r0_ra0_count0_lutreg_q;
    u0_m0_wo0_wi0_r0_memr0_dmem : altsyncram
    GENERIC MAP (
        ram_block_type => "M9K",
        operation_mode => "DUAL_PORT",
        width_a => 8,
        widthad_a => 2,
        numwords_a => 3,
        width_b => 8,
        widthad_b => 2,
        numwords_b => 3,
        lpm_type => "altsyncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        wrcontrol_wraddress_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK0",
        outdata_aclr_b => "NONE",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "FALSE",
        init_file => "UNUSED",
        intended_device_family => "Cyclone IV E"
    )
    PORT MAP (
        clocken0 => '1',
        clock0 => clk,
        address_a => u0_m0_wo0_wi0_r0_memr0_aa,
        data_a => u0_m0_wo0_wi0_r0_memr0_ia,
        wren_a => d_in0_m0_wi0_wo0_assign_id1_q_13_q(0),
        address_b => u0_m0_wo0_wi0_r0_memr0_ab,
        q_b => u0_m0_wo0_wi0_r0_memr0_iq
    );
    u0_m0_wo0_wi0_r0_memr0_q <= u0_m0_wo0_wi0_r0_memr0_iq(7 downto 0);

    -- d_u0_m0_wo0_wi0_r0_memr0_q_15(DELAY,146)@13 + 2
    d_u0_m0_wo0_wi0_r0_memr0_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => d_u0_m0_wo0_wi0_r0_memr0_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_ca25(COUNTER,49)@12
    -- low=0, high=1, step=1, init=0
    u0_m0_wo0_ca25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_ca25_i <= TO_UNSIGNED(0, 1);
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (u0_m0_wo0_compute_q = "1") THEN
                u0_m0_wo0_ca25_i <= u0_m0_wo0_ca25_i + 1;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_ca25_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(u0_m0_wo0_ca25_i, 1)));

    -- d_u0_m0_wo0_ca25_q_14(DELAY,148)@12 + 2
    d_u0_m0_wo0_ca25_q_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_ca25_q, xout => d_u0_m0_wo0_ca25_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm0(LOOKUP,53)@14 + 1
    u0_m0_wo0_cm0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm0_q <= "0001100100111010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca25_q_14_q) IS
                WHEN "0" => u0_m0_wo0_cm0_q <= "0001100100111010";
                WHEN "1" => u0_m0_wo0_cm0_q <= "0111111111111111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm0_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_25(MULT,79)@15 + 2
    u0_m0_wo0_mtree_mult1_25_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm0_q);
    u0_m0_wo0_mtree_mult1_25_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_memr0_q_15_q);
    u0_m0_wo0_mtree_mult1_25_reset <= areset;
    u0_m0_wo0_mtree_mult1_25_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_25_a0,
        datab => u0_m0_wo0_mtree_mult1_25_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_25_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_25_s1
    );
    u0_m0_wo0_mtree_mult1_25_q <= u0_m0_wo0_mtree_mult1_25_s1;

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,24)@13
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_memr0_q, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_15(DELAY,147)@13 + 2
    d_u0_m0_wo0_wi0_r0_delayr1_q_15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_15_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_cm1(LOOKUP,54)@14 + 1
    u0_m0_wo0_cm1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm1_q <= "0001110111110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (d_u0_m0_wo0_ca25_q_14_q) IS
                WHEN "0" => u0_m0_wo0_cm1_q <= "0001110111110011";
                WHEN "1" => u0_m0_wo0_cm1_q <= "0001101110010010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm1_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_24(MULT,80)@15 + 2
    u0_m0_wo0_mtree_mult1_24_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm1_q);
    u0_m0_wo0_mtree_mult1_24_b0 <= STD_LOGIC_VECTOR(d_u0_m0_wo0_wi0_r0_delayr1_q_15_q);
    u0_m0_wo0_mtree_mult1_24_reset <= areset;
    u0_m0_wo0_mtree_mult1_24_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_24_a0,
        datab => u0_m0_wo0_mtree_mult1_24_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_24_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_24_s1
    );
    u0_m0_wo0_mtree_mult1_24_q <= u0_m0_wo0_mtree_mult1_24_s1;

    -- u0_m0_wo0_mtree_add0_12(ADD,117)@17 + 1
    u0_m0_wo0_mtree_add0_12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_24_q(23)) & u0_m0_wo0_mtree_mult1_24_q));
    u0_m0_wo0_mtree_add0_12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_25_q(23)) & u0_m0_wo0_mtree_mult1_25_q));
    u0_m0_wo0_mtree_add0_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_12_a) + SIGNED(u0_m0_wo0_mtree_add0_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_12_q <= u0_m0_wo0_mtree_add0_12_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,25)@13
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm2(LOOKUP,55)@12 + 1
    u0_m0_wo0_cm2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm2_q <= "0010001011001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm2_q <= "0010001011001000";
                WHEN "1" => u0_m0_wo0_cm2_q <= "0010000001100000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm2_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_23(MULT,81)@13 + 2
    u0_m0_wo0_mtree_mult1_23_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm2_q);
    u0_m0_wo0_mtree_mult1_23_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr2_q);
    u0_m0_wo0_mtree_mult1_23_reset <= areset;
    u0_m0_wo0_mtree_mult1_23_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_23_a0,
        datab => u0_m0_wo0_mtree_mult1_23_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_23_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_23_s1
    );
    u0_m0_wo0_mtree_mult1_23_q <= u0_m0_wo0_mtree_mult1_23_s1;

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,26)@13
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm3(LOOKUP,56)@12 + 1
    u0_m0_wo0_cm3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm3_q <= "0010011110010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm3_q <= "0010011110010011";
                WHEN "1" => u0_m0_wo0_cm3_q <= "0010010100110010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm3_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_22(MULT,82)@13 + 2
    u0_m0_wo0_mtree_mult1_22_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm3_q);
    u0_m0_wo0_mtree_mult1_22_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr3_q);
    u0_m0_wo0_mtree_mult1_22_reset <= areset;
    u0_m0_wo0_mtree_mult1_22_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_22_a0,
        datab => u0_m0_wo0_mtree_mult1_22_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_22_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_22_s1
    );
    u0_m0_wo0_mtree_mult1_22_q <= u0_m0_wo0_mtree_mult1_22_s1;

    -- u0_m0_wo0_mtree_add0_11(ADD,116)@15 + 1
    u0_m0_wo0_mtree_add0_11_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_22_q(23)) & u0_m0_wo0_mtree_mult1_22_q));
    u0_m0_wo0_mtree_add0_11_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_23_q(23)) & u0_m0_wo0_mtree_mult1_23_q));
    u0_m0_wo0_mtree_add0_11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_11_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_11_a) + SIGNED(u0_m0_wo0_mtree_add0_11_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_11_q <= u0_m0_wo0_mtree_add0_11_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,27)@13
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm4(LOOKUP,57)@12 + 1
    u0_m0_wo0_cm4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm4_q <= "0010110001000001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm4_q <= "0010110001000001";
                WHEN "1" => u0_m0_wo0_cm4_q <= "0010100111110110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm4_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_21(MULT,83)@13 + 2
    u0_m0_wo0_mtree_mult1_21_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm4_q);
    u0_m0_wo0_mtree_mult1_21_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr4_q);
    u0_m0_wo0_mtree_mult1_21_reset <= areset;
    u0_m0_wo0_mtree_mult1_21_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_21_a0,
        datab => u0_m0_wo0_mtree_mult1_21_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_21_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_21_s1
    );
    u0_m0_wo0_mtree_mult1_21_q <= u0_m0_wo0_mtree_mult1_21_s1;

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,28)@13
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm5(LOOKUP,58)@12 + 1
    u0_m0_wo0_cm5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm5_q <= "0011000010101101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm5_q <= "0011000010101101";
                WHEN "1" => u0_m0_wo0_cm5_q <= "0010111010001001";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm5_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_20(MULT,84)@13 + 2
    u0_m0_wo0_mtree_mult1_20_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm5_q);
    u0_m0_wo0_mtree_mult1_20_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr5_q);
    u0_m0_wo0_mtree_mult1_20_reset <= areset;
    u0_m0_wo0_mtree_mult1_20_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_20_a0,
        datab => u0_m0_wo0_mtree_mult1_20_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_20_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_20_s1
    );
    u0_m0_wo0_mtree_mult1_20_q <= u0_m0_wo0_mtree_mult1_20_s1;

    -- u0_m0_wo0_mtree_add0_10(ADD,115)@15 + 1
    u0_m0_wo0_mtree_add0_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_20_q(23)) & u0_m0_wo0_mtree_mult1_20_q));
    u0_m0_wo0_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_21_q(23)) & u0_m0_wo0_mtree_mult1_21_q));
    u0_m0_wo0_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_10_a) + SIGNED(u0_m0_wo0_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_10_q <= u0_m0_wo0_mtree_add0_10_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_5(ADD,123)@16 + 1
    u0_m0_wo0_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_10_q(24)) & u0_m0_wo0_mtree_add0_10_q));
    u0_m0_wo0_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_11_q(24)) & u0_m0_wo0_mtree_add0_11_q));
    u0_m0_wo0_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_5_a) + SIGNED(u0_m0_wo0_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_5_q <= u0_m0_wo0_mtree_add1_5_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,29)@13
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm6(LOOKUP,59)@12 + 1
    u0_m0_wo0_cm6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm6_q <= "0011010011011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm6_q <= "0011010011011100";
                WHEN "1" => u0_m0_wo0_cm6_q <= "0011001011010010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm6_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_19(MULT,85)@13 + 2
    u0_m0_wo0_mtree_mult1_19_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm6_q);
    u0_m0_wo0_mtree_mult1_19_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr6_q);
    u0_m0_wo0_mtree_mult1_19_reset <= areset;
    u0_m0_wo0_mtree_mult1_19_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_19_a0,
        datab => u0_m0_wo0_mtree_mult1_19_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_19_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_19_s1
    );
    u0_m0_wo0_mtree_mult1_19_q <= u0_m0_wo0_mtree_mult1_19_s1;

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,30)@13
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm7(LOOKUP,60)@12 + 1
    u0_m0_wo0_cm7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm7_q <= "0011100001111110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm7_q <= "0011100001111110";
                WHEN "1" => u0_m0_wo0_cm7_q <= "0011011010100010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm7_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_18(MULT,86)@13 + 2
    u0_m0_wo0_mtree_mult1_18_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm7_q);
    u0_m0_wo0_mtree_mult1_18_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr7_q);
    u0_m0_wo0_mtree_mult1_18_reset <= areset;
    u0_m0_wo0_mtree_mult1_18_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_18_a0,
        datab => u0_m0_wo0_mtree_mult1_18_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_18_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_18_s1
    );
    u0_m0_wo0_mtree_mult1_18_q <= u0_m0_wo0_mtree_mult1_18_s1;

    -- u0_m0_wo0_mtree_add0_9(ADD,114)@15 + 1
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_18_q(23)) & u0_m0_wo0_mtree_mult1_18_q));
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_19_q(23)) & u0_m0_wo0_mtree_mult1_19_q));
    u0_m0_wo0_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,31)@13
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm8(LOOKUP,61)@12 + 1
    u0_m0_wo0_cm8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm8_q <= "0011101110110010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm8_q <= "0011101110110010";
                WHEN "1" => u0_m0_wo0_cm8_q <= "0011101000101010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm8_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_17(MULT,87)@13 + 2
    u0_m0_wo0_mtree_mult1_17_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm8_q);
    u0_m0_wo0_mtree_mult1_17_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr8_q);
    u0_m0_wo0_mtree_mult1_17_reset <= areset;
    u0_m0_wo0_mtree_mult1_17_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_17_a0,
        datab => u0_m0_wo0_mtree_mult1_17_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_17_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_17_s1
    );
    u0_m0_wo0_mtree_mult1_17_q <= u0_m0_wo0_mtree_mult1_17_s1;

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,32)@13
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm9(LOOKUP,62)@12 + 1
    u0_m0_wo0_cm9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm9_q <= "0011111000101100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm9_q <= "0011111000101100";
                WHEN "1" => u0_m0_wo0_cm9_q <= "0011110011111101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm9_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_16(MULT,88)@13 + 2
    u0_m0_wo0_mtree_mult1_16_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm9_q);
    u0_m0_wo0_mtree_mult1_16_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr9_q);
    u0_m0_wo0_mtree_mult1_16_reset <= areset;
    u0_m0_wo0_mtree_mult1_16_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_16_a0,
        datab => u0_m0_wo0_mtree_mult1_16_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_16_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_16_s1
    );
    u0_m0_wo0_mtree_mult1_16_q <= u0_m0_wo0_mtree_mult1_16_s1;

    -- u0_m0_wo0_mtree_add0_8(ADD,113)@15 + 1
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_16_q(23)) & u0_m0_wo0_mtree_mult1_16_q));
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_17_q(23)) & u0_m0_wo0_mtree_mult1_17_q));
    u0_m0_wo0_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_4(ADD,122)@16 + 1
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_8_q(24)) & u0_m0_wo0_mtree_add0_8_q));
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_9_q(24)) & u0_m0_wo0_mtree_add0_9_q));
    u0_m0_wo0_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(25 downto 0);

    -- u0_m0_wo0_mtree_add2_2(ADD,126)@17 + 1
    u0_m0_wo0_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_4_q(25)) & u0_m0_wo0_mtree_add1_4_q));
    u0_m0_wo0_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_5_q(25)) & u0_m0_wo0_mtree_add1_5_q));
    u0_m0_wo0_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_2_a) + SIGNED(u0_m0_wo0_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_2_q <= u0_m0_wo0_mtree_add2_2_o(26 downto 0);

    -- u0_m0_wo0_mtree_add3_1(ADD,128)@18 + 1
    u0_m0_wo0_mtree_add3_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add2_2_q(26)) & u0_m0_wo0_mtree_add2_2_q));
    u0_m0_wo0_mtree_add3_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 25 => u0_m0_wo0_mtree_add0_12_q(24)) & u0_m0_wo0_mtree_add0_12_q));
    u0_m0_wo0_mtree_add3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_1_a) + SIGNED(u0_m0_wo0_mtree_add3_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_1_q <= u0_m0_wo0_mtree_add3_1_o(27 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,33)@13
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm10(LOOKUP,63)@12 + 1
    u0_m0_wo0_cm10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm10_q <= "0100000000010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm10_q <= "0100000000010010";
                WHEN "1" => u0_m0_wo0_cm10_q <= "0011111100101111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm10_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_15(MULT,89)@13 + 2
    u0_m0_wo0_mtree_mult1_15_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm10_q);
    u0_m0_wo0_mtree_mult1_15_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr10_q);
    u0_m0_wo0_mtree_mult1_15_reset <= areset;
    u0_m0_wo0_mtree_mult1_15_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_15_a0,
        datab => u0_m0_wo0_mtree_mult1_15_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_15_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_15_s1
    );
    u0_m0_wo0_mtree_mult1_15_q <= u0_m0_wo0_mtree_mult1_15_s1;

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,34)@13
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm11(LOOKUP,64)@12 + 1
    u0_m0_wo0_cm11_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm11_q <= "0100000100110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm11_q <= "0100000100110011";
                WHEN "1" => u0_m0_wo0_cm11_q <= "0100000010110111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm11_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_14(MULT,90)@13 + 2
    u0_m0_wo0_mtree_mult1_14_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm11_q);
    u0_m0_wo0_mtree_mult1_14_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr11_q);
    u0_m0_wo0_mtree_mult1_14_reset <= areset;
    u0_m0_wo0_mtree_mult1_14_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_14_a0,
        datab => u0_m0_wo0_mtree_mult1_14_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_14_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_14_s1
    );
    u0_m0_wo0_mtree_mult1_14_q <= u0_m0_wo0_mtree_mult1_14_s1;

    -- u0_m0_wo0_mtree_add0_7(ADD,112)@15 + 1
    u0_m0_wo0_mtree_add0_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_14_q(23)) & u0_m0_wo0_mtree_mult1_14_q));
    u0_m0_wo0_mtree_add0_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_15_q(23)) & u0_m0_wo0_mtree_mult1_15_q));
    u0_m0_wo0_mtree_add0_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_7_a) + SIGNED(u0_m0_wo0_mtree_add0_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_7_q <= u0_m0_wo0_mtree_add0_7_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,35)@13
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm12(LOOKUP,65)@12 + 1
    u0_m0_wo0_cm12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm12_q <= "0100000110011011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm12_q <= "0100000110011011";
                WHEN "1" => u0_m0_wo0_cm12_q <= "0100000101111000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm12_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_13(MULT,91)@13 + 2
    u0_m0_wo0_mtree_mult1_13_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm12_q);
    u0_m0_wo0_mtree_mult1_13_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr12_q);
    u0_m0_wo0_mtree_mult1_13_reset <= areset;
    u0_m0_wo0_mtree_mult1_13_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_13_a0,
        datab => u0_m0_wo0_mtree_mult1_13_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_13_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_13_s1
    );
    u0_m0_wo0_mtree_mult1_13_q <= u0_m0_wo0_mtree_mult1_13_s1;

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,36)@13
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm13(LOOKUP,66)@12 + 1
    u0_m0_wo0_cm13_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm13_q <= "0100000100110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm13_q <= "0100000100110011";
                WHEN "1" => u0_m0_wo0_cm13_q <= "0100000101111000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm13_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_12(MULT,92)@13 + 2
    u0_m0_wo0_mtree_mult1_12_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm13_q);
    u0_m0_wo0_mtree_mult1_12_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr13_q);
    u0_m0_wo0_mtree_mult1_12_reset <= areset;
    u0_m0_wo0_mtree_mult1_12_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_12_a0,
        datab => u0_m0_wo0_mtree_mult1_12_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_12_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_12_s1
    );
    u0_m0_wo0_mtree_mult1_12_q <= u0_m0_wo0_mtree_mult1_12_s1;

    -- u0_m0_wo0_mtree_add0_6(ADD,111)@15 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_12_q(23)) & u0_m0_wo0_mtree_mult1_12_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_13_q(23)) & u0_m0_wo0_mtree_mult1_13_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,121)@16 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_6_q(24)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_7_q(24)) & u0_m0_wo0_mtree_add0_7_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,37)@13
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm14(LOOKUP,67)@12 + 1
    u0_m0_wo0_cm14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm14_q <= "0100000000010010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm14_q <= "0100000000010010";
                WHEN "1" => u0_m0_wo0_cm14_q <= "0100000010110111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm14_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_11(MULT,93)@13 + 2
    u0_m0_wo0_mtree_mult1_11_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm14_q);
    u0_m0_wo0_mtree_mult1_11_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr14_q);
    u0_m0_wo0_mtree_mult1_11_reset <= areset;
    u0_m0_wo0_mtree_mult1_11_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_11_a0,
        datab => u0_m0_wo0_mtree_mult1_11_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_11_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_11_s1
    );
    u0_m0_wo0_mtree_mult1_11_q <= u0_m0_wo0_mtree_mult1_11_s1;

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,38)@13
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm15(LOOKUP,68)@12 + 1
    u0_m0_wo0_cm15_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm15_q <= "0011111000101100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm15_q <= "0011111000101100";
                WHEN "1" => u0_m0_wo0_cm15_q <= "0011111100101111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm15_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_10(MULT,94)@13 + 2
    u0_m0_wo0_mtree_mult1_10_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm15_q);
    u0_m0_wo0_mtree_mult1_10_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr15_q);
    u0_m0_wo0_mtree_mult1_10_reset <= areset;
    u0_m0_wo0_mtree_mult1_10_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_10_a0,
        datab => u0_m0_wo0_mtree_mult1_10_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_10_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_10_s1
    );
    u0_m0_wo0_mtree_mult1_10_q <= u0_m0_wo0_mtree_mult1_10_s1;

    -- u0_m0_wo0_mtree_add0_5(ADD,110)@15 + 1
    u0_m0_wo0_mtree_add0_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_10_q(23)) & u0_m0_wo0_mtree_mult1_10_q));
    u0_m0_wo0_mtree_add0_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_11_q(23)) & u0_m0_wo0_mtree_mult1_11_q));
    u0_m0_wo0_mtree_add0_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_5_a) + SIGNED(u0_m0_wo0_mtree_add0_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_5_q <= u0_m0_wo0_mtree_add0_5_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,39)@13
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm16(LOOKUP,69)@12 + 1
    u0_m0_wo0_cm16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm16_q <= "0011101110110010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm16_q <= "0011101110110010";
                WHEN "1" => u0_m0_wo0_cm16_q <= "0011110011111101";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm16_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_9(MULT,95)@13 + 2
    u0_m0_wo0_mtree_mult1_9_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm16_q);
    u0_m0_wo0_mtree_mult1_9_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr16_q);
    u0_m0_wo0_mtree_mult1_9_reset <= areset;
    u0_m0_wo0_mtree_mult1_9_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_9_a0,
        datab => u0_m0_wo0_mtree_mult1_9_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_9_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_9_s1
    );
    u0_m0_wo0_mtree_mult1_9_q <= u0_m0_wo0_mtree_mult1_9_s1;

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,40)@13
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm17(LOOKUP,70)@12 + 1
    u0_m0_wo0_cm17_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm17_q <= "0011100001111110";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm17_q <= "0011100001111110";
                WHEN "1" => u0_m0_wo0_cm17_q <= "0011101000101010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm17_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_8(MULT,96)@13 + 2
    u0_m0_wo0_mtree_mult1_8_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm17_q);
    u0_m0_wo0_mtree_mult1_8_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr17_q);
    u0_m0_wo0_mtree_mult1_8_reset <= areset;
    u0_m0_wo0_mtree_mult1_8_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_8_a0,
        datab => u0_m0_wo0_mtree_mult1_8_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_8_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_8_s1
    );
    u0_m0_wo0_mtree_mult1_8_q <= u0_m0_wo0_mtree_mult1_8_s1;

    -- u0_m0_wo0_mtree_add0_4(ADD,109)@15 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_8_q(23)) & u0_m0_wo0_mtree_mult1_8_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_9_q(23)) & u0_m0_wo0_mtree_mult1_9_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,120)@16 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_4_q(24)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_5_q(24)) & u0_m0_wo0_mtree_add0_5_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(25 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,125)@17 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_2_q(25)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_3_q(25)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(26 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,41)@13
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm18(LOOKUP,71)@12 + 1
    u0_m0_wo0_cm18_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm18_q <= "0011010011011100";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm18_q <= "0011010011011100";
                WHEN "1" => u0_m0_wo0_cm18_q <= "0011011010100010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm18_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_7(MULT,97)@13 + 2
    u0_m0_wo0_mtree_mult1_7_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm18_q);
    u0_m0_wo0_mtree_mult1_7_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr18_q);
    u0_m0_wo0_mtree_mult1_7_reset <= areset;
    u0_m0_wo0_mtree_mult1_7_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_7_a0,
        datab => u0_m0_wo0_mtree_mult1_7_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_7_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_7_s1
    );
    u0_m0_wo0_mtree_mult1_7_q <= u0_m0_wo0_mtree_mult1_7_s1;

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,42)@13
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm19(LOOKUP,72)@12 + 1
    u0_m0_wo0_cm19_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm19_q <= "0011000010101101";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm19_q <= "0011000010101101";
                WHEN "1" => u0_m0_wo0_cm19_q <= "0011001011010010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm19_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_6(MULT,98)@13 + 2
    u0_m0_wo0_mtree_mult1_6_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm19_q);
    u0_m0_wo0_mtree_mult1_6_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr19_q);
    u0_m0_wo0_mtree_mult1_6_reset <= areset;
    u0_m0_wo0_mtree_mult1_6_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_6_a0,
        datab => u0_m0_wo0_mtree_mult1_6_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_6_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_6_s1
    );
    u0_m0_wo0_mtree_mult1_6_q <= u0_m0_wo0_mtree_mult1_6_s1;

    -- u0_m0_wo0_mtree_add0_3(ADD,108)@15 + 1
    u0_m0_wo0_mtree_add0_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_6_q(23)) & u0_m0_wo0_mtree_mult1_6_q));
    u0_m0_wo0_mtree_add0_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_7_q(23)) & u0_m0_wo0_mtree_mult1_7_q));
    u0_m0_wo0_mtree_add0_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_3_a) + SIGNED(u0_m0_wo0_mtree_add0_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_3_q <= u0_m0_wo0_mtree_add0_3_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr20(DELAY,43)@13
    u0_m0_wo0_wi0_r0_delayr20 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => u0_m0_wo0_wi0_r0_delayr20_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm20(LOOKUP,73)@12 + 1
    u0_m0_wo0_cm20_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm20_q <= "0010110001000001";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm20_q <= "0010110001000001";
                WHEN "1" => u0_m0_wo0_cm20_q <= "0010111010001001";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm20_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_5(MULT,99)@13 + 2
    u0_m0_wo0_mtree_mult1_5_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm20_q);
    u0_m0_wo0_mtree_mult1_5_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr20_q);
    u0_m0_wo0_mtree_mult1_5_reset <= areset;
    u0_m0_wo0_mtree_mult1_5_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_5_a0,
        datab => u0_m0_wo0_mtree_mult1_5_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_5_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_5_s1
    );
    u0_m0_wo0_mtree_mult1_5_q <= u0_m0_wo0_mtree_mult1_5_s1;

    -- u0_m0_wo0_wi0_r0_delayr21(DELAY,44)@13
    u0_m0_wo0_wi0_r0_delayr21 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => u0_m0_wo0_wi0_r0_delayr21_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm21(LOOKUP,74)@12 + 1
    u0_m0_wo0_cm21_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm21_q <= "0010011110010011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm21_q <= "0010011110010011";
                WHEN "1" => u0_m0_wo0_cm21_q <= "0010100111110110";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm21_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_4(MULT,100)@13 + 2
    u0_m0_wo0_mtree_mult1_4_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm21_q);
    u0_m0_wo0_mtree_mult1_4_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr21_q);
    u0_m0_wo0_mtree_mult1_4_reset <= areset;
    u0_m0_wo0_mtree_mult1_4_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_4_a0,
        datab => u0_m0_wo0_mtree_mult1_4_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_4_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_4_s1
    );
    u0_m0_wo0_mtree_mult1_4_q <= u0_m0_wo0_mtree_mult1_4_s1;

    -- u0_m0_wo0_mtree_add0_2(ADD,107)@15 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_4_q(23)) & u0_m0_wo0_mtree_mult1_4_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_5_q(23)) & u0_m0_wo0_mtree_mult1_5_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,119)@16 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_2_q(24)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_3_q(24)) & u0_m0_wo0_mtree_add0_3_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(25 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr22(DELAY,45)@13
    u0_m0_wo0_wi0_r0_delayr22 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => u0_m0_wo0_wi0_r0_delayr22_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm22(LOOKUP,75)@12 + 1
    u0_m0_wo0_cm22_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm22_q <= "0010001011001000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm22_q <= "0010001011001000";
                WHEN "1" => u0_m0_wo0_cm22_q <= "0010010100110010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm22_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_3(MULT,101)@13 + 2
    u0_m0_wo0_mtree_mult1_3_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm22_q);
    u0_m0_wo0_mtree_mult1_3_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr22_q);
    u0_m0_wo0_mtree_mult1_3_reset <= areset;
    u0_m0_wo0_mtree_mult1_3_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_3_a0,
        datab => u0_m0_wo0_mtree_mult1_3_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_3_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_3_s1
    );
    u0_m0_wo0_mtree_mult1_3_q <= u0_m0_wo0_mtree_mult1_3_s1;

    -- u0_m0_wo0_wi0_r0_delayr23(DELAY,46)@13
    u0_m0_wo0_wi0_r0_delayr23 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr22_q, xout => u0_m0_wo0_wi0_r0_delayr23_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm23(LOOKUP,76)@12 + 1
    u0_m0_wo0_cm23_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm23_q <= "0001110111110011";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm23_q <= "0001110111110011";
                WHEN "1" => u0_m0_wo0_cm23_q <= "0010000001100000";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm23_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_2(MULT,102)@13 + 2
    u0_m0_wo0_mtree_mult1_2_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm23_q);
    u0_m0_wo0_mtree_mult1_2_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr23_q);
    u0_m0_wo0_mtree_mult1_2_reset <= areset;
    u0_m0_wo0_mtree_mult1_2_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_2_a0,
        datab => u0_m0_wo0_mtree_mult1_2_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_2_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_2_s1
    );
    u0_m0_wo0_mtree_mult1_2_q <= u0_m0_wo0_mtree_mult1_2_s1;

    -- u0_m0_wo0_mtree_add0_1(ADD,106)@15 + 1
    u0_m0_wo0_mtree_add0_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_2_q(23)) & u0_m0_wo0_mtree_mult1_2_q));
    u0_m0_wo0_mtree_add0_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_3_q(23)) & u0_m0_wo0_mtree_mult1_3_q));
    u0_m0_wo0_mtree_add0_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_1_a) + SIGNED(u0_m0_wo0_mtree_add0_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_1_q <= u0_m0_wo0_mtree_add0_1_o(24 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr24(DELAY,47)@13
    u0_m0_wo0_wi0_r0_delayr24 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr23_q, xout => u0_m0_wo0_wi0_r0_delayr24_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm24(LOOKUP,77)@12 + 1
    u0_m0_wo0_cm24_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm24_q <= "0001100100111010";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm24_q <= "0001100100111010";
                WHEN "1" => u0_m0_wo0_cm24_q <= "0001101110010010";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm24_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_1(MULT,103)@13 + 2
    u0_m0_wo0_mtree_mult1_1_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm24_q);
    u0_m0_wo0_mtree_mult1_1_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr24_q);
    u0_m0_wo0_mtree_mult1_1_reset <= areset;
    u0_m0_wo0_mtree_mult1_1_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_1_a0,
        datab => u0_m0_wo0_mtree_mult1_1_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_1_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_1_s1
    );
    u0_m0_wo0_mtree_mult1_1_q <= u0_m0_wo0_mtree_mult1_1_s1;

    -- u0_m0_wo0_wi0_r0_delayr25(DELAY,48)@13
    u0_m0_wo0_wi0_r0_delayr25 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr24_q, xout => u0_m0_wo0_wi0_r0_delayr25_q, ena => d_u0_m0_wo0_compute_q_13_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_cm25(LOOKUP,78)@12 + 1
    u0_m0_wo0_cm25_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_cm25_q <= "0000000000000000";
        ELSIF (clk'EVENT AND clk = '1') THEN
            CASE (u0_m0_wo0_ca25_q) IS
                WHEN "0" => u0_m0_wo0_cm25_q <= "0000000000000000";
                WHEN "1" => u0_m0_wo0_cm25_q <= "0111111111111111";
                WHEN OTHERS => -- unreachable
                               u0_m0_wo0_cm25_q <= (others => '-');
            END CASE;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_mtree_mult1_0(MULT,104)@13 + 2
    u0_m0_wo0_mtree_mult1_0_a0 <= STD_LOGIC_VECTOR(u0_m0_wo0_cm25_q);
    u0_m0_wo0_mtree_mult1_0_b0 <= STD_LOGIC_VECTOR(u0_m0_wo0_wi0_r0_delayr25_q);
    u0_m0_wo0_mtree_mult1_0_reset <= areset;
    u0_m0_wo0_mtree_mult1_0_component : lpm_mult
    GENERIC MAP (
        lpm_widtha => 16,
        lpm_widthb => 8,
        lpm_widthp => 24,
        lpm_widths => 1,
        lpm_type => "LPM_MULT",
        lpm_representation => "SIGNED",
        lpm_hint => "DEDICATED_MULTIPLIER_CIRCUITRY=YES, MAXIMIZE_SPEED=5",
        lpm_pipeline => 2
    )
    PORT MAP (
        dataa => u0_m0_wo0_mtree_mult1_0_a0,
        datab => u0_m0_wo0_mtree_mult1_0_b0,
        clken => VCC_q(0),
        aclr => u0_m0_wo0_mtree_mult1_0_reset,
        clock => clk,
        result => u0_m0_wo0_mtree_mult1_0_s1
    );
    u0_m0_wo0_mtree_mult1_0_q <= u0_m0_wo0_mtree_mult1_0_s1;

    -- u0_m0_wo0_mtree_add0_0(ADD,105)@15 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_0_q(23)) & u0_m0_wo0_mtree_mult1_0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((24 downto 24 => u0_m0_wo0_mtree_mult1_1_q(23)) & u0_m0_wo0_mtree_mult1_1_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(24 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,118)@16 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_0_q(24)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((25 downto 25 => u0_m0_wo0_mtree_add0_1_q(24)) & u0_m0_wo0_mtree_add0_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(25 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,124)@17 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_0_q(25)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((26 downto 26 => u0_m0_wo0_mtree_add1_1_q(25)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(26 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,127)@18 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add2_0_q(26)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((27 downto 27 => u0_m0_wo0_mtree_add2_1_q(26)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(27 downto 0);

    -- u0_m0_wo0_mtree_add4_0(ADD,129)@19 + 1
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add3_0_q(27)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((28 downto 28 => u0_m0_wo0_mtree_add3_1_q(27)) & u0_m0_wo0_mtree_add3_1_q));
    u0_m0_wo0_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(28 downto 0);

    -- u0_m0_wo0_accum(ADD,131)@20 + 1
    u0_m0_wo0_accum_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((29 downto 29 => u0_m0_wo0_mtree_add4_0_q(28)) & u0_m0_wo0_mtree_add4_0_q));
    u0_m0_wo0_accum_b <= STD_LOGIC_VECTOR(u0_m0_wo0_accum_q);
    u0_m0_wo0_accum_i <= u0_m0_wo0_accum_a;
    u0_m0_wo0_accum_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_accum_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_20_q = "1") THEN
                IF (u0_m0_wo0_aseq_q = "1") THEN
                    u0_m0_wo0_accum_o <= u0_m0_wo0_accum_i;
                ELSE
                    u0_m0_wo0_accum_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_accum_a) + SIGNED(u0_m0_wo0_accum_b));
                END IF;
            END IF;
        END IF;
    END PROCESS;
    u0_m0_wo0_accum_q <= u0_m0_wo0_accum_o(29 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- u0_m0_wo0_oseq(SEQUENCE,132)@19 + 1
    u0_m0_wo0_oseq_clkproc: PROCESS (clk, areset)
        variable u0_m0_wo0_oseq_c : SIGNED(3 downto 0);
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_c := "0001";
            u0_m0_wo0_oseq_q <= "0";
            u0_m0_wo0_oseq_eq <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (d_u0_m0_wo0_compute_q_19_q = "1") THEN
                IF (u0_m0_wo0_oseq_c = "0000") THEN
                    u0_m0_wo0_oseq_eq <= '1';
                ELSE
                    u0_m0_wo0_oseq_eq <= '0';
                END IF;
                IF (u0_m0_wo0_oseq_eq = '1') THEN
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c + 1;
                ELSE
                    u0_m0_wo0_oseq_c := u0_m0_wo0_oseq_c - 1;
                END IF;
                u0_m0_wo0_oseq_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_c(3 downto 3));
            END IF;
        END IF;
    END PROCESS;

    -- u0_m0_wo0_oseq_gated(LOGICAL,133)@20
    u0_m0_wo0_oseq_gated_q <= u0_m0_wo0_oseq_q and d_u0_m0_wo0_compute_q_20_q;

    -- u0_m0_wo0_oseq_gated_reg(REG,134)@20 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(u0_m0_wo0_oseq_gated_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,139)@21 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_accum_q;

END normal;
