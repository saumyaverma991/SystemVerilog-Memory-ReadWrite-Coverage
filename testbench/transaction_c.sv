class tx;
rand bit [`ADDR_WIDTH-1:0]addr;
rand bit [`WIDTH-1:0]data;
rand bit wr_rd;
function void print(input string s);
	$display("%s",s);
	$display("addr=%h",addr);
	$display("data=%h",data);
	$display("wr_rd=%s",(wr_rd==1)?"WRITE":"READ");
endfunction
endclass
