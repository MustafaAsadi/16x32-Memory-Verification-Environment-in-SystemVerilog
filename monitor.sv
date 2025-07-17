class monitor;
  virtual inter vif;
  out_trans ot;

  function new();
    ot = new();
  endfunction

  task sample();
    ot.Data_out = vif.CB.Data_out;
    ot.Valid_out = vif.CB.Valid_out;
    $display("[MONITOR] Data_out = %0h | Valid_out = %0d", ot.Data_out, ot.Valid_out);
  endtask
endclass
