class agent;
generator ge;
bfm bf;
monitor mon;
coverage co;
function new();
		ge=new();
		bf=new();
  		mon=new();
  		co =new();
endfunction
task run();
$display("*****agent*****");
fork
	ge.run();
	bf.run();
	mon.run();
	co.run();
join
endtask
endclass


