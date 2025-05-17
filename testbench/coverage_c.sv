class coverage;
tx mem_tx;
covergroup mem_cg;
     ADDR_cp:coverpoint mem_tx.addr{
	  //option.auto_bin_max=8;
	  bins LOW_RANGE ={[40:100]};
	  bins NORMAL_RANGE ={[101:125]};
	  bins HIGH_RANGE ={[126:150]};	  
	  }
	  wr_rd_cp:coverpoint mem_tx.wr_rd{
	    bins WRITE = {1'b1};
		bins READ ={1'b0};
	}
	 ADDR_X_wr_rd_cp: cross ADDR_cp, wr_rd_cp;
endgroup

  function new();
	mem_cg=new();
  endfunction
task run();
	$display("coverage");
	while (1) begin
		common::montocov.get(mem_tx);
      
		mem_cg.sample();
      $display ("Coverage = %.2f%%", mem_cg.get_coverage());
		mem_tx.print(mem_tx.wr_rd==1 ? "COV_WR" : "COV_RD");
	end
endtask
endclass

program cover_p;
  initial begin
    coverage cov;
    
    cov =new;
    cov.run();
  end
endprogram