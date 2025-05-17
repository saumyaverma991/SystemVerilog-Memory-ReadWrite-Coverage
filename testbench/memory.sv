module memory(pclk_i,prst_i,paddr_i,pwdata_i,prdata_o,pwr_rd_i,penable_i,pready_o);
input pclk_i,prst_i,pwr_rd_i,penable_i;
input [`ADDR_WIDTH-1:0] paddr_i;
input [`WIDTH-1:0] pwdata_i;
output reg[`WIDTH-1:0] prdata_o;
output reg pready_o;
integer i;
reg [`WIDTH-1:0]mem[`DEPTH-1:0];
always @(posedge pclk_i) begin
	if(prst_i==1) begin
	   prdata_o=0;
	   pready_o=0;
              for(i=0;i<`DEPTH;i=i+1) begin
                      mem[i]=0;
		end
	end
	else begin
		if(penable_i==1) begin
			pready_o=1;
			  if(pwr_rd_i==1) begin
				mem[paddr_i]=pwdata_i;
			  end
			  else begin
				prdata_o=mem[paddr_i];
			  end
		end
		else begin
                    pready_o=0;
		end
	end
end
endmodule

