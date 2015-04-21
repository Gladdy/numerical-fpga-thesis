// Automatically generated SystemVerilog
import types:: * ;
module testbench(done);
  output logic [0:0] done;
  logic [0:0] finished;
  logic system1000;
  logic system1000_rst;
  product0 eta_i1;
  logic signed [8:0] topLet_o;
  assign done = finished;
  
  // pragma translate_off
  always_comb begin
    if (finished == 1'b1) begin
      $finish;
    end
  end
  // pragma translate_on
  
  
  // pragma translate_off
  always begin
    system1000 = 0;
    #2 forever begin
      system1000 = ~ system1000;
      #500;
      system1000 = ~ system1000;
      #500;
    end
  end
  // pragma translate_on
  
  // pragma translate_off
  initial begin
    system1000_rst = 0;
    #1 system1000_rst = 1;
  end
  // pragma translate_on
  
  topEntity_0 totest
  (.system1000 (system1000)
  ,.system1000_rst (system1000_rst)
  ,.eta_i1 (eta_i1)
  ,.topLet_o (topLet_o));
  
  assign eta_i1 = '{{9 {1'bx}},{9 {1'bx}}};
  
  always begin
  // pragma translate_off
    finished <= 1'b0;
    #100
  // pragma translate_on
    finished = 1'b1;
  end
endmodule
