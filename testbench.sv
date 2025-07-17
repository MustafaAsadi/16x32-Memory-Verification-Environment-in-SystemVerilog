
`include "env.sv"
module test_top;
  bit clk = 0; 
  logic rst;

  inter test_if(clk);

  memory mem(
    .clk(clk),
    .rst(test_if.rst),
    .EN(test_if.EN),
    .address(test_if.address),
    .Data_in(test_if.Data_in),
    .Data_out(test_if.Data_out),
    .Valid_out(test_if.Valid_out)
  );

  env e;


  always #1 clk = ~clk;


  initial begin
    test_if.rst = 1;
    test_if.EN = 0;
    test_if.address = 0;
    test_if.Data_in = 0;

    #20;
    test_if.rst = 0;

    e = new(test_if);
    e.run();

    #100;
    $finish;
  end
endmodule
