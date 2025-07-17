module memory (
    input logic         clk,
    input logic         rst,
    input logic         EN,
    input logic [3:0]   address,
    input logic [31:0]  Data_in,
    output logic [31:0] Data_out,
    output logic        Valid_out
);

    
    logic [31:0] mem [15:0];

    
    logic [31:0] data_out_reg;
    logic        valid_out_reg;

  
    assign Data_out  = data_out_reg;
    assign Valid_out = valid_out_reg;
  
always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
 
  for (int i = 0; i < 16; i++) begin
    mem[i] = $urandom;
  end

        data_out_reg  <= 32'b0;
        valid_out_reg <= 1'b0;
    end else begin
        if (EN) begin
          data_out_reg <= Data_in;
            mem[address] <= Data_in;            
                        
            valid_out_reg <= 1'b1;
        end else begin
            valid_out_reg <= 1'b0;
          data_out_reg<=32'b0;
        end
    end
end
endmodule
