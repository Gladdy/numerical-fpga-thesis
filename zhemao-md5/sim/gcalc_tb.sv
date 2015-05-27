module gcalc_tb ();

reg [5:0] i;
wire [3:0] g;

gcalc gc (
    .i (i),
    .g (g)
);

initial begin
    i = 6'd3;
    #20000 assert (g == 6'd3);
    i = 6'd17;
    #20000 assert (g == 6'd6);
    i = 6'd37;
    #20000 assert (g == 6'd4);
    i = 6'd52;
    #20000 assert (g == 6'd12);
end

endmodule
