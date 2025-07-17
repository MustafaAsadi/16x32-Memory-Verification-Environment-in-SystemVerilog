class driver;
  virtual inter vif;

  task drive(input transaction tr);
    vif.EN      = tr.EN;
    vif.address = tr.address;
    vif.Data_in = tr.Data_in;
  endtask

  task reset();
    vif.EN      = 0;
    vif.address = 0;
    vif.Data_in = 0;
  endtask
endclass
