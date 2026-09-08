// Emily Ing
// eing@g.hmc.edu
// Date of creation: 9/5/2026
// Summary: Top module used to instantiate modules plus the switch-to-LED assign logic.

module lab1_ei(
	input logic [3:0] s, // DIP switches
	input  logic reset,
	output logic [6:0] seg,
	output logic [2:0] led,
	output logic clk
);
		
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
	
	// Instantiate seven-segment display decoder module
	lab1_7_seg_decoder_ei lab1_7_seg_decoder_ei_inst(s, seg);
	
	// Instantiate counter module and blinking for led[2] using a counter
	lab1_counter_ei lab1_counter_ei_inst(.clk(clk), .reset(reset), .enable(1'b1), .led(led[2]));
	
	// Switch-to-LED logic for led[0]
	assign led[0] = s[1] ^ s[0];
	
	// Switch-to-LED logic for led[1]
	assign led[1] = s[3] & s[2];


endmodule