class bfm;
tx mem_tx;
//int no_of_bfm;
virtual memory_interface vif_bfm;
function new();
//	no_of_bfm=i;
	vif_bfm=common::common_vif;
//	vif_bfm=top.memory_pif;	
endfunction
task run();
	$display("BFM");
	forever begin
		common::gentbfm.get(mem_tx);
//		common::smp.get(1);
      drive_tx(mem_tx); 
		mem_tx.print("getting transactions");
//		common::total_driven_tx++;
//		common::smp.put(1);
	end
endtask
  task drive_tx(tx mem_tx);
		$display("driving transaction in bfm from gen");
      @(posedge vif_bfm.pclk_i);
	    vif_bfm.paddr_i<=mem_tx.addr;
		vif_bfm.pwr_rd_i<=mem_tx.wr_rd;
		if(mem_tx.wr_rd==1) begin
			vif_bfm.pwdata_i<=mem_tx.data;
		end
		if(mem_tx.wr_rd==0) begin
			mem_tx.data <= vif_bfm.prdata_o;
		end
		vif_bfm.penable_i<=1;
		wait (vif_bfm.pready_o==1);
//		$display("BFM %0d",no_of_bfm);
		@(posedge vif_bfm.pclk_i);
		vif_bfm.paddr_i<=0;
		vif_bfm.pwr_rd_i<=0;
		vif_bfm.pwdata_i<=0;
		vif_bfm.penable_i<=0;
	endtask
endclass
