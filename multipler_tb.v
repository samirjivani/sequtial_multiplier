`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 12:37:37
// Design Name: 
// Module Name: multipler_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module multipler_tb;

parameter dp_width = 5;

wire [2 * dp_width - 1:0] Product;
wire Ready;
reg [dp_width - 1:0] Multiplicand, Multiplier;
reg Start, clock, reset_b;

multiplier M0 (
  .Product(Product),
  .Ready(Ready),
  .Multiplicand(Multiplicand),
  .Multiplier(Multiplier),
  .Start(Start),
  .clock(clock),
  .reset_b(reset_b)
);

// Generate stimulus waveforms
initial #200 $finish;

initial
begin
  Start = 0;
  reset_b = 0;
  #2 Start = 1; reset_b = 1;
  Multiplicand = 5'b10111;
  Multiplier = 5'b10011;
  #10 Start = 0;
end

initial
begin
  clock = 0;
  repeat (26) #5 clock = ~clock;
end

// Display results and compare with Table 8.5
always @(posedge clock)
  $strobe("C=%b A=%b Q=%b P=%b time=%0d", M0.C, M0.A, M0.Q, M0.P, $time);
endmodule



