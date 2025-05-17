interface memory_interface(input logic pclk_i,prst_i);
logic pwr_rd_i,penable_i;
logic [`ADDR_WIDTH-1:0] paddr_i;
logic [`WIDTH-1:0] pwdata_i;
logic[`WIDTH-1:0] prdata_o;
logic pready_o;

endinterface

