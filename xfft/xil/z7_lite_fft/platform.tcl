# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\hawk_\workspace\z7_lite_fft\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\hawk_\workspace\z7_lite_fft\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {z7_lite_fft}\
-hw {C:\sandbox\zynq\z7_lite_linux\z7_lite_linux.xsa}\
-proc {ps7_cortexa9} -os {linux} -out {C:/Users/hawk_/workspace}

platform write
platform active {z7_lite_fft}
platform generate
