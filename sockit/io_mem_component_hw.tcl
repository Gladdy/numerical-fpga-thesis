# TCL File Generated by Component Editor 14.1
# Tue May 26 19:42:59 CEST 2015
# DO NOT MODIFY


# 
# io_mem_component "io_mem_component" v1.0
# Martijn Bakker 2015.05.26.19:42:59
# 
# 

# 
# request TCL package from ACDS 14.1
# 
package require -exact qsys 14.1


# 
# module io_mem_component
# 
set_module_property DESCRIPTION ""
set_module_property NAME io_mem_component
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR "Martijn Bakker"
set_module_property DISPLAY_NAME io_mem_component
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL io_mem
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file io_mem.vhd VHDL PATH hdl/io_mem.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clock clk Input 1


# 
# connection point avalon_control
# 
add_interface avalon_control avalon end
set_interface_property avalon_control addressUnits WORDS
set_interface_property avalon_control associatedClock clock
set_interface_property avalon_control associatedReset reset
set_interface_property avalon_control bitsPerSymbol 8
set_interface_property avalon_control burstOnBurstBoundariesOnly false
set_interface_property avalon_control burstcountUnits WORDS
set_interface_property avalon_control explicitAddressSpan 0
set_interface_property avalon_control holdTime 0
set_interface_property avalon_control linewrapBursts false
set_interface_property avalon_control maximumPendingReadTransactions 0
set_interface_property avalon_control maximumPendingWriteTransactions 0
set_interface_property avalon_control readLatency 0
set_interface_property avalon_control readWaitTime 1
set_interface_property avalon_control setupTime 0
set_interface_property avalon_control timingUnits Cycles
set_interface_property avalon_control writeWaitTime 0
set_interface_property avalon_control ENABLED true
set_interface_property avalon_control EXPORT_OF ""
set_interface_property avalon_control PORT_NAME_MAP ""
set_interface_property avalon_control CMSIS_SVD_VARIABLES ""
set_interface_property avalon_control SVD_ADDRESS_GROUP ""

add_interface_port avalon_control control_data writedata Input 32
add_interface_port avalon_control control_set write Input 1
set_interface_assignment avalon_control embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_control embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_control embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_control embeddedsw.configuration.isPrintableDevice 0


# 
# connection point conduit_export
# 
add_interface conduit_export conduit end
set_interface_property conduit_export associatedClock clock
set_interface_property conduit_export associatedReset reset
set_interface_property conduit_export ENABLED true
set_interface_property conduit_export EXPORT_OF ""
set_interface_property conduit_export PORT_NAME_MAP ""
set_interface_property conduit_export CMSIS_SVD_VARIABLES ""
set_interface_property conduit_export SVD_ADDRESS_GROUP ""

add_interface_port conduit_export control_data_export export_control_data Output 32
add_interface_port conduit_export control_set_export export_control_set Output 1
add_interface_port conduit_export input_data_export export_input_data Output 128
add_interface_port conduit_export input_set_export export_input_set Output 1
add_interface_port conduit_export output_set_export export_output_set Input 1
add_interface_port conduit_export output_data_export export_output_data Input 128
add_interface_port conduit_export output_waitrequest_export export_output_waitrequest Output 1


# 
# connection point avalon_input
# 
add_interface avalon_input avalon end
set_interface_property avalon_input addressUnits SYMBOLS
set_interface_property avalon_input associatedClock clock
set_interface_property avalon_input associatedReset reset
set_interface_property avalon_input bitsPerSymbol 128
set_interface_property avalon_input burstOnBurstBoundariesOnly false
set_interface_property avalon_input burstcountUnits SYMBOLS
set_interface_property avalon_input explicitAddressSpan 0
set_interface_property avalon_input holdTime 0
set_interface_property avalon_input linewrapBursts false
set_interface_property avalon_input maximumPendingReadTransactions 0
set_interface_property avalon_input maximumPendingWriteTransactions 0
set_interface_property avalon_input readLatency 0
set_interface_property avalon_input readWaitTime 1
set_interface_property avalon_input setupTime 0
set_interface_property avalon_input timingUnits Cycles
set_interface_property avalon_input writeWaitTime 0
set_interface_property avalon_input ENABLED true
set_interface_property avalon_input EXPORT_OF ""
set_interface_property avalon_input PORT_NAME_MAP ""
set_interface_property avalon_input CMSIS_SVD_VARIABLES ""
set_interface_property avalon_input SVD_ADDRESS_GROUP ""

add_interface_port avalon_input input_set write Input 1
add_interface_port avalon_input input_data writedata Input 128
set_interface_assignment avalon_input embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_input embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_input embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_input embeddedsw.configuration.isPrintableDevice 0


# 
# connection point avalon_output
# 
add_interface avalon_output avalon start
set_interface_property avalon_output addressUnits SYMBOLS
set_interface_property avalon_output associatedClock clock
set_interface_property avalon_output associatedReset reset
set_interface_property avalon_output bitsPerSymbol 128
set_interface_property avalon_output burstOnBurstBoundariesOnly true
set_interface_property avalon_output burstcountUnits WORDS
set_interface_property avalon_output doStreamReads false
set_interface_property avalon_output doStreamWrites false
set_interface_property avalon_output holdTime 0
set_interface_property avalon_output linewrapBursts false
set_interface_property avalon_output maximumPendingReadTransactions 0
set_interface_property avalon_output maximumPendingWriteTransactions 0
set_interface_property avalon_output readLatency 0
set_interface_property avalon_output readWaitTime 1
set_interface_property avalon_output setupTime 0
set_interface_property avalon_output timingUnits Cycles
set_interface_property avalon_output writeWaitTime 0
set_interface_property avalon_output ENABLED true
set_interface_property avalon_output EXPORT_OF ""
set_interface_property avalon_output PORT_NAME_MAP ""
set_interface_property avalon_output CMSIS_SVD_VARIABLES ""
set_interface_property avalon_output SVD_ADDRESS_GROUP ""

add_interface_port avalon_output output_waitrequest waitrequest Input 1
add_interface_port avalon_output output_set write Output 1
add_interface_port avalon_output output_data writedata Output 128

