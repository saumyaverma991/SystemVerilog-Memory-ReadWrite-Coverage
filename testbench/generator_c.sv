class generator;
tx mem_tx;
bit [`ADDR_WIDTH-1:0] temp_mem_tx[$];
int no_of_gen;

task run();
	$display("Generator");
case(common::testcase)
	"TEST_1_WR_1_RD": begin
		//WRITE
		mem_tx=new();
		assert(mem_tx.randomize() with {mem_tx.wr_rd==1'b1;});
		common::gentbfm.put(mem_tx);
		mem_tx.print("GENERATOR WRITE OPERATION");
		temp_mem_tx.push_back(mem_tx.addr);
		
		//READ
		mem_tx=new();
		mem_tx.wr_rd=1'b0;
		mem_tx.addr=temp_mem_tx.pop_front();
		common::gentbfm.put(mem_tx);
		mem_tx.print("GENERATOR READ OPERATION");
	end
	default: $display("testcase not matching");
		 
endcase
endtask
endclass
