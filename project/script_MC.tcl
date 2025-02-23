# generate project script
# vivado_hls -f <filename>
# vivado_hls -p match_calc
# WARNING: this will wipe out the original project by the same name

# set part (KU115) and clock 240 MHz
set part "xcku115-flvb2104-2-e"
set clockperiod 4.1667         

# delete old project
delete_project match_calc
# make new project
open_project match_calc
set_top MatchCalculator

# source files
add_files ../TrackletAlgorithm/MatchCalculatorTop.cpp -cflags "-std=c++11"
add_files -tb -cflags "-I ../TrackletAlgorithm -std=c++11" ../TestBenches/MatchCalculator_test.cpp

# data files
add_files -tb ../emData/MC/

# solutions
open_solution "solution1"
set_part $part -tool vivado
create_clock -period $clockperiod -name default
#source "directives_MC.tcl"

#set_part {xcku115-flvb2104-2-e} -tool vivado
#create_clock -period 10 -name default
#source "./match_calc/solution1/directives.tcl"
csim_design
#csynth_design
#cosim_design
#export_design -format ip_catalog


# exit vivado_hls
quit
