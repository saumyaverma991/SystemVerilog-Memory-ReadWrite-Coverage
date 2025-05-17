`define DEPTH 256
`define WIDTH 16
`define ADDR_WIDTH $clog2(`DEPTH)

class common;

	static mailbox montocov=new();
	static virtual memory_interface common_vif;
	static string testcase;
	static int no_of_tx=2;

  static mailbox gentbfm=new(); //fixed array


endclass

