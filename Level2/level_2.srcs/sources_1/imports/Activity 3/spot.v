module spot (
input wire clk,
input wire spot_in,
output wire spot_out);

// you write the module code!
reg Q;
always @(posedge clk) begin
    Q <= spot_in;
end

assign spot_out = spot_in & (~Q);
endmodule