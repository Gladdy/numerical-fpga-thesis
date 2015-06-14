rm -rf vhdl 
clash --vhdl Solver.hs 
rm -rf ..\sockit\hdl\*.vhdl 
cp vhdl\Solver\* ..\sockit\hdl\