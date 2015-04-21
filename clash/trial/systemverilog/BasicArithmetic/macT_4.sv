// Automatically generated SystemVerilog
import types:: * ;
module macT_4(acc_i1
             ,ds_i2
             ,topLet_o);
  input logic signed [8:0] acc_i1;
  input product0 ds_i2;
  output product0 topLet_o;
  logic signed [8:0] repANF_0;
  logic signed [8:0] repANF_1;
  product0 altLet_2;
  logic signed [8:0] x_3;
  logic signed [8:0] y_4;
  assign repANF_0 = x_3 * y_4;
  
  assign repANF_1 = acc_i1 + repANF_0;
  
  assign altLet_2 = '{product0_sel0: repANF_1
                     ,product0_sel1: acc_i1};
  
  assign x_3 = ds_i2.product0_sel0;
  
  assign y_4 = ds_i2.product0_sel1;
  
  assign topLet_o = altLet_2;
endmodule
