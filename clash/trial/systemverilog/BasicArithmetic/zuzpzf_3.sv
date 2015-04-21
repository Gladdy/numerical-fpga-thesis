// Automatically generated SystemVerilog
import types:: * ;
module zuzpzf_3(ds_i1
               ,eta_i2
               ,system1000
               ,system1000_rst
               ,topLet_o);
  input product0 ds_i1;
  input product0 eta_i2;
  input logic system1000;
  input logic system1000_rst;
  output product0 topLet_o;
  logic signed [8:0] repANF_0;
  logic signed [8:0] szm_1;
  logic signed [8:0] tmp_2;
  logic signed [8:0] n_4;
  
  always_ff @(posedge system1000 or negedge system1000_rst)
  if (~ system1000_rst) begin
    n_4 <= 9'sd0;
  end else begin
    n_4 <= szm_1;
  end
  
  assign tmp_2 = n_4;
  
  assign repANF_0 = tmp_2;
  
  assign szm_1 = ds_i1.product0_sel0;
  
  macT_4 macT_4_topLet_o
  (.topLet_o (topLet_o)
  ,.acc_i1 (repANF_0)
  ,.ds_i2 (eta_i2));
endmodule
