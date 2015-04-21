package types ;
  typedef struct {
    logic signed [8:0] product0_sel0;
    logic signed [8:0] product0_sel1;
  } product0;
  function logic [8:0] signed_9_to_lv(logic signed [8:0] i);
    signed_9_to_lv = i;
  endfunction
  function logic [17:0] product0_to_lv(product0 i);
    product0_to_lv = {signed_9_to_lv(i.product0_sel0)
                     ,signed_9_to_lv(i.product0_sel1)};
  endfunction
  function logic [0:0] logic_vector_1_to_lv(logic [0:0] i);
    logic_vector_1_to_lv = i;
  endfunction
endpackage : types
