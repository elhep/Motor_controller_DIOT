
cmake_minimum_required(VERSION 3.15)
project(bsp)
        
set(DRIVER_TARGETS gpio;spi;uartlite;intc)
set(DRIVER_LOCATIONS C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/gpio_v4_10;C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/spi_v4_11;C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/uartlite_v3_9;C:/Xilinx/Vitis/2023.2/data/embeddedsw/XilinxProcessorIPLib/drivers/intc_v3_17)

list(LENGTH DRIVER_TARGETS no_of_drivers)
set(index 0)

while(${index} LESS ${no_of_drivers})
    list(GET DRIVER_TARGETS ${index} drv)
    list(GET DRIVER_LOCATIONS ${index} drv_dir)
    set(exp_dir "${drv_dir}/examples")
    add_custom_target(
        ${drv}_example ALL
        COMMAND lopper -f -O C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/libsrc/${drv} C:/Users/piotr/Dropbox/Projects2/FPGA/motion_controller/FW/vitis2/platform/microblaze_0/standalone_microblaze_0/bsp/hw_artifacts/microblaze_0_baremetal.dts -- bmcmake_metadata_xlnx microblaze_0 ${exp_dir} drvcmake_metadata
        BYPRODUCTS x${drv}_exlist.yaml)
    MATH(EXPR index "${index}+1")
endwhile()
