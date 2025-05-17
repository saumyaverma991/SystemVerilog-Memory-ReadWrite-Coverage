module top;
reg clk,rst;
env envi;
memory_interface memory_pif(clk,rst);
common common_i=new();//assign memory for common class object
initial begin
	clk=0;
	forever #5 clk=~clk;
end
initial begin
	rst=1;
	memory_pif.paddr_i=0;
  	memory_pif.pwdata_i=0;
  	memory_pif.pwr_rd_i=0;
  	memory_pif.penable_i=0;
  	$value$plusargs("testcase=%s",common::testcase);
	$value$plusargs("no_of_tx=%b",common::no_of_tx);
	repeat(2) @(posedge clk);
	rst=0;
	$display("*****TOP*****");
	envi=new();
	envi.run();

end

memory dut(.pclk_i(memory_pif.pclk_i),
	.prst_i(memory_pif.prst_i),
	.paddr_i(memory_pif.paddr_i),
	.pwr_rd_i(memory_pif.pwr_rd_i),
	.penable_i(memory_pif.penable_i),
	.pwdata_i(memory_pif.pwdata_i),
	.prdata_o(memory_pif.prdata_o),
	.pready_o(memory_pif.pready_o));

initial begin
	common::common_vif=memory_pif;
end
initial begin 

	#1000;
	$finish;
end
endmodule



