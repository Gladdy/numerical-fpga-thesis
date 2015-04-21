// Automatically generated SystemVerilog
import types:: * ;
module topEntity_0(eta_i1
                  ,system1000
                  ,system1000_rst
                  ,topLet_o);
  input product0 eta_i1;
  input logic system1000;
  input logic system1000_rst;
  output logic signed [8:0] topLet_o;
  mealyzm_1 mealyzm_1_topLet_o
  (.bodyVar_o (topLet_o)
  ,.system1000 (system1000)
  ,.system1000_rst (system1000_rst)
  ,.eta_i1 (eta_i1));
endmodule
