// Automatically generated SystemVerilog
import types:: * ;
module mealyzm_1(eta_i1
                ,system1000
                ,system1000_rst
                ,bodyVar_o);
  input product0 eta_i1;
  input logic system1000;
  input logic system1000_rst;
  output logic signed [8:0] bodyVar_o;
  logic signed [8:0] o1_0;
  product0 bodyVar_1;
  product0 x_2;
  assign bodyVar_o = o1_0;
  
  assign o1_0 = bodyVar_1.product0_sel1;
  
  BundleZ2T1_2 BundleZ2T1_2_bodyVar_1
  (.topLet_o (bodyVar_1)
  ,.eta_i1 (x_2));
  
  zuzpzf_3 zuzpzf_3_x_2
  (.topLet_o (x_2)
  ,.system1000 (system1000)
  ,.system1000_rst (system1000_rst)
  ,.ds_i1 (bodyVar_1)
  ,.eta_i2 (eta_i1));
endmodule
