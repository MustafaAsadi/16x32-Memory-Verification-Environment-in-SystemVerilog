

class scoreboard;

  out_trans ot;
  virtual inter vif;
  task check(input out_trans ot);
    if(vif.rst) begin
        assert(ot.Data_out!=vif.Data_in)
          $display("[SCOREBOARD]: Data_out = %0h | Valid_out =%0h",ot.Data_out,ot.Valid_out);
      else
        $error("Data_out is not zero OR Valid_out is not zero Data_out = %0h | Valid_out",ot.Data_out,ot.Valid_out);
    end
    else begin
    case(vif.EN) 
    1'b1: begin
      assert((ot.Data_out==vif.Data_in) & (ot.Valid_out ==1) )
        $display("[SCOREBOARD]: Data_in = %0h | Data_out = %0h | Valid_out = %0h",vif.Data_in,ot.Data_out,ot.Valid_out);
      else
        $error("Data_out does not equal data_in or valid_out does not equal 1  Data_in = %0h | Data_out = %0h | Valid_out = %0h",vif.Data_in,ot.Data_out,ot.Valid_out);
    
    end
      
          1'b0: begin
            assert((ot.Data_out==0) & (ot.Valid_out == 0 ))
              $display("[SCOREBOARD]: Data_out = %0h | Valid_out = %0h",ot.Data_out,ot.Valid_out);
      else
        $error("Data_out is not zero OR Valid_out is not zero Data_out = %0h | Valid_out",ot.Data_out,ot.Valid_out);
    
    end
    endcase
    end
  endtask
  
  
  
  
  
  
  
  
endclass
