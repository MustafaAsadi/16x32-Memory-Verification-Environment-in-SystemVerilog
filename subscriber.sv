
class subscriber;
virtual inter vif;
out_trans ot;
  

 
  covergroup out_cov;
    
    coverpoint ot.Data_out {
      bins zero = {0};
      bins low_range = {[1:32'h0000FFFF]};
      bins high_range = {[32'h0001FFFF:32'hFFFFFFFE]};
      bins max = {32'hFFFFFFFF};
    }
    coverpoint ot.Valid_out {
      bins zero = {0};
      bins one = {1};
    }
  
  endgroup
  
     function new();
    ot = new();
       out_cov = new();
    endfunction
    
  task sample(input out_trans ot) ;
     this.ot = ot;
      out_cov.sample();
    endtask

  
endclass
