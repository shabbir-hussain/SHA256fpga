//testbench for the sha256 module
module tb_sha256();

reg clk;
reg rst;
wire [9:0] addr;
wire [7:0] data;
reg [7:0] dataLen;
reg padStart;
wire padFinish;

pad pad_inst(
    .clk(clk),
    .rst(rst),
    .memAddrLine(addr),
    .memDataLine(data),
    .dataLen(dataLen),
    .start(padStart),
    .finish(padFinish)
);

reg chipSel;
reg wriEn;
reg outEn;

ram #(8,10,512,30)
ram_inst(
    .clk(clk),
    .addr(addr),
    .chipSel(chipSel),
    .wriEn(wriEn),
    .outEn(outEn),
    .data(data)
);

reg [9:0]addrToBlock;
reg [9:0]addrToDigest;
reg shaStart;
wire shaFinish;
wire rp, wp;

sha256 #(10,8,32,64)
sha256_inst(
    .clk(clk),
    .rst(rst),
    .addrToBlock(addrToBlock),
    .addrToDigest(addrToDigest),
    .addr(addr),
    .data(data),
    .readPhase(rp),
    .writePhase(wp),
    .start(shaStart),
    .finish(shaFinish)
);

initial
    clk=0;
always @(clk)
    clk <= #10 ~clk;

initial begin
    dataLen <= 8'd30;
    padStart <= 0;
    shaStart <=0;
    rst <= 1;
    chipSel <=1;
    wriEn <= 0;
    outEn <=0;
    addrToBlock<=0;
    addrToDigest<= 10'd64;
@(negedge clk);
    rst <= 0;
    padStart <= 1;
    wriEn <= 1;
end

always @(posedge padFinish) begin
    shaStart<=1;
end

always @(posedge rp) begin
    if(!rst) begin
        outEn <= 1;
        wriEn <= 0;
    end
end
always @(posedge wp) begin
    if(!rst) begin
        outEn <= 0;
        wriEn <= 1;
    end
end

always @(posedge shaFinish) begin
    $display("At t=%t clk=%b ", $time,clk);
    $display("Cycles: %d", ($time-50)/20);
    $stop;
end

endmodule
