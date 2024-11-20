@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Nov 16 17:17:06 +0100 2024
REM SW Build 4029153 on Fri Oct 13 20:14:34 MDT 2023
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_motion_controller_behav -key {Behavioral:sim_1:Functional:tb_motion_controller} -tclbatch tb_motion_controller.tcl -protoinst "protoinst_files/bd_c78d.protoinst" -protoinst "protoinst_files/design_2.protoinst" -view C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/HDL/Tests/dds_test/tb_dds_compiler_2_behav.wcfg -log simulate.log"
call xsim  tb_motion_controller_behav -key {Behavioral:sim_1:Functional:tb_motion_controller} -tclbatch tb_motion_controller.tcl -protoinst "protoinst_files/bd_c78d.protoinst" -protoinst "protoinst_files/design_2.protoinst" -view C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/HDL/Tests/dds_test/tb_dds_compiler_2_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
