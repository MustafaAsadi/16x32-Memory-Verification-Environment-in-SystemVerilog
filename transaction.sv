class transaction;
  rand bit EN;
  rand bit [3:0] address;
  rand bit [31:0] Data_in;
  virtual inter vif;


  covergroup CG;
    coverpoint EN {
      bins enable_mem  = {1};
      bins disable_mem = {0};
    }
    coverpoint address {
      bins first_addr = {0};
      bins last_addr  = {4'hF};
      bins even_addr  = {[0:4'hF]} iff (address%2 == 0);
      bins odd_addr   = {[0:4'hF]} iff (address%2 == 1);
    }
    coverpoint Data_in {
      bins first_data = {0};
      bins last_data  = {32'hFFFF};
      bins even_data  = {[0:32'hFFFFFFFF]} iff (Data_in%2==0);
      bins odd_data   = {[0:32'hFFFFFFFF]} iff (Data_in%2==1);
    }
  endgroup
  
  function new();
    CG= new();
  endfunction
  task sample();
    CG.sample();
  endtask


endclass
