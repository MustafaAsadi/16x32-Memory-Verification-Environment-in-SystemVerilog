interface inter(input bit clk);
  logic rst,EN;
  logic [3:0] address;
  logic [31:0] Data_in;
  logic [31:0] Data_out;
  logic Valid_out;
  
  clocking CB @(posedge clk);
   default input #1ns;
  default output #0ns;
  output  rst,EN;
  output  address;
  output   Data_in;
  input   Data_out;
  input   Valid_out;
  endclocking
  
    
endinterface
