class monitor;
tx mem_tx=new();
int no_of_mon;
	virtual memory_interface vif_mon;
  function new();
//		vif_mon=common::common_vif;
//      	no_of_mon=i;
    	vif_mon=top.memory_pif;
	endfunction

task run();
           $display("*****monitor*****");
	   forever begin
//	   	@(vif_mon.monitor_CB);
         @(posedge vif_mon.pclk_i);
	   		if(vif_mon.penable_i==1 && vif_mon.pready_o==1) begin
					//convert the signal to tx level
		   	mem_tx.addr = vif_mon.paddr_i;
		   	mem_tx.wr_rd = vif_mon.pwr_rd_i;
		   	mem_tx.data = vif_mon.pwr_rd_i==1 ? vif_mon.pwdata_i : vif_mon.prdata_o;
		   	common::montocov.put(mem_tx);
		   	mem_tx.print(mem_tx.wr_rd==1 ? "MON_WR" : "MON_RD");
	   		end
	   end
endtask
endclass
