// Emily Ing
// eing@g.hmc.edu
// Date of creation: 9/5/2026
// Summary: Module for E155 Lab 1, which contains the counter that blinks led[2].

module lab1_counter_ei #(parameter MAXCOUNT = 10_000_000, parameter WIDTH = 25)(
	input  logic clk,
	input  logic reset,
	input  logic enable,
	output logic led
);
	
	logic [WIDTH-1:0] counter = 25'b0;
	logic led_state = 0;
	
	// Simple clock divider
	always_ff @(posedge clk) begin
		if (!reset) begin // 0 = high and 1 = low.
				counter <= 25'b0;
				led_state <= 0;
			end	
   // Choosing a max count of 10,000,000 due to calculations of 48 mHz/4.8 Hz	
		else if (enable) begin
			if (counter >= MAXCOUNT) begin
					counter <= 25'b0;
					led_state <= ~led_state; // toggles led on and off
				end
			else begin
					counter <= counter + 25'd1;
					led_state <= led_state;
				end
			end
		else begin
				counter <= counter + 25'd0;
				led_state <= led_state;
			end
		end
	
	assign led = led_state;
	
endmodule