
`include "interface.sv"
`include "transaction.sv"
`include "out_transaction.sv"
`include "sequencer.sv"
`include "Driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "subscriber.sv"

class env;
  driver drv;
  sequencer seq;
  monitor mon;
  virtual inter vif;
  scoreboard score;
  subscriber sub;
  int counter=1;

  
  function new(virtual inter vif);
    this.vif = vif;
    drv = new(); drv.vif = vif;
    seq = new(); seq.vif = vif;
    mon = new(); mon.vif = vif;
    score = new(); score.vif = vif;
    sub = new(); sub.vif = vif;
  endfunction
  
  task reset();
    drv.reset();
  endtask
  
 task run();
  int i;



   for (i = 0; i < 1200; i++) begin

    seq.gen();           
	 $display("[INFO] Packet #%0d has been initialized successfully", counter);
    drv.drive(seq.tr);   
        
     @(vif.CB); 
            
     @(vif.CB); 
            
     @(vif.CB); 

    mon.sample();        
    
     score.check(mon.ot);
     sub.sample(mon.ot);
    counter++;
  end
   $display("[COVERAGE]: Total Coverege is %0d/100",$get_coverage());
endtask
  
  
  
  
  
  
endclass
