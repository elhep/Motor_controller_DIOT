# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe

# The command to remove a file.
RM = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp

# Utility rule file for common.

# Include any custom commands dependencies for this target.
include CMakeFiles/common.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/common.dir/progress.make

CMakeFiles/common:
	lopper -O C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/common/src C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/hw_artifacts/microblaze_0_baremetal.dts -- baremetalconfig_xlnx microblaze_0 C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/common_v1_3/src

common: CMakeFiles/common
common: CMakeFiles/common.dir/build.make
.PHONY : common

# Rule to build all files generated by this target.
CMakeFiles/common.dir/build: common
.PHONY : CMakeFiles/common.dir/build

CMakeFiles/common.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/common.dir/cmake_clean.cmake
.PHONY : CMakeFiles/common.dir/clean

CMakeFiles/common.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/build_configs/gen_bsp/CMakeFiles/common.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/common.dir/depend
