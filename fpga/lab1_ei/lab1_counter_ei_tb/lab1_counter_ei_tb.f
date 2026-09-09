-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/eing/Documents/GitHub/e155-lab1/fpga/lab1_ei/source/impl_1/lab1_counter_ei.sv" 
"C:/Users/eing/Documents/GitHub/e155-lab1/fpga/lab1_ei/source/impl_1/lab1_counter_ei_tb.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_counter_ei_tb
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run -all"
