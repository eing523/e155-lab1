// Emily Ing
// eing@g.hmc.edu
// Date of creation: 9/5/2026
// Summary: Module for E155 Lab 1, which contains the counter that blinks led[2].

module lab1_counter_ei(
	input   logic reset,
	output  logic led
);

	logic int_osc;
	logic pulse;
	logic led_state = 0;
	logic [24:0] counter = 0;
	
	// Internal high-speed oscillator
	HSOSC hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// Simple clock divider
	always_ff @(posedge int_osc) begin
		if (reset) begin
			counter <= 0;
			led <= 0;
	end	
   // Choosing a hard-coded max count of 5,000,000 due to calculations of 24 mHz/4.8 Hz	
		else if (counter >= 5000000) begin
			counter <= 0;
			led <= ~led;
	end
		else begin
			counter <= counter + 1;
		end
	end

	
endmodule