// Emily Ing
// eing@g.hmc.edu
// Date of creation: 9/5/2026
// Summary: Top module used to instantiate modules plus the switch-to-LED assign logic.

module lab1_ei(
	input   logic [3:0] s, // DIP switches
	output  logic [2:0] led	
);
	logic [6:0] seg;
	logic reset;
	
	// Instantiate seven-segment display decoder module
	lab1_7_seg_decoder_ei lab1_7_seg_decoder_ei_inst(s, seg);
	
	// Instantiate counter module and blinking for led[2] using a counter
	lab1_counter_ei lab1_counter_ei_inst(reset, led[2]);
	
	// Switch-to-LED logic for led[1]
	assign led[1] = s[1] ^ s[0];
	
	// Switch-to-LED logic for led[0]
	assign led[0] = s[3] & s[2];


endmodule