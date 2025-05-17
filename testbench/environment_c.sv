class env;
	//agent ag;
	agent ag;
task run();
	ag=new();
	$display("environment");
	ag.run();
endtask

endclass
