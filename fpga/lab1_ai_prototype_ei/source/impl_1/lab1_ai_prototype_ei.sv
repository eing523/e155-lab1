module top (
    output logic led
);

    // Internal clock signal
    logic clk;

    // Instantiate the Lattice iCE40 UltraPlus high-speed oscillator for Radiant (HSOSC)
    HSOSC #(
        .CLKHF_DIV("0b11") // Divide base 48 MHz by 8 to get 6 MHz
    ) hfosc_inst (
        .CLKHFPU(1'b1),    // Power up the oscillator
        .CLKHFEN(1'b1),    // Enable the clock output
        .CLKHF(clk)        // Route to our internal clk signal
    );

    // 21-bit counter initialized to zero
    // 21 bits are required to count up to 1,500,000
    logic [20:0] counter = '0; 
    
    // LED register initialized to zero
    logic led_reg = 1'b0;
    
    assign led = led_reg;

    always_ff @(posedge clk) begin
        // To get a 2 Hz blink rate (0.5 second period), the LED must toggle 
        // every 0.25 seconds. At 6 MHz, 0.25s is exactly 1,500,000 cycles.
        if (counter == 21'd1_499_999) begin
            counter <= '0;         
            led_reg <= ~led_reg;
        end else begin
            counter <= counter + 1'b1;
        end
    end

endmodule