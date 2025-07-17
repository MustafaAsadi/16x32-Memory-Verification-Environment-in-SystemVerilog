class sequencer;
  virtual inter vif;
  transaction tr;
  int counter = 1;

  task gen();
    
    @(vif.CB);
      tr = new();  

      if (!tr.randomize()) begin
        $error("[ERROR] transaction #%0d has failed", counter);
      end
    tr.sample();
     
    $display("[SEQUENCE] EN = %0d | address = %0h | Data_in = %0h", tr.EN, tr.address, tr.Data_in);

      counter++;

  endtask
endclass
