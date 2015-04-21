// Automatically generated SystemVerilog
import types:: * ;
module BundleZ2T1_2(eta_i1
                   ,topLet_o);
  input product0 eta_i1;
  output product0 topLet_o;
  logic signed [8:0] repANF_0;
  logic signed [8:0] repANF_1;
  logic signed [8:0] x_2;
  logic signed [8:0] y_3;
  assign repANF_0 = x_2;
  
  assign repANF_1 = y_3;
  
  assign x_2 = eta_i1.product0_sel0;
  
  assign y_3 = eta_i1.product0_sel1;
  
  assign topLet_o = '{product0_sel0: repANF_0
                     ,product0_sel1: repANF_1};
endmodule
