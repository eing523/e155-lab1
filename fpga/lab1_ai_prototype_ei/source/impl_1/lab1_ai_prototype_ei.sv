module lab1_ai_prototype_ei (
    output logic led
);

    // ------------------------------------------------------------------------
    // Clock configuration
    // ------------------------------------------------------------------------

    localparam int unsigned CLOCK_HZ = 24_000_000;
    localparam int unsigned BLINK_HZ = 2;

    // Toggle the LED twice per blink period:
    //
    //   24 MHz / (2 * 2 Hz) = 6,000,000 clock cycles per toggle
    //
    localparam int unsigned HALF_PERIOD =
        CLOCK_HZ / (2 * BLINK_HZ);

    localparam int unsigned COUNTER_WIDTH =
        $clog2(HALF_PERIOD);

    logic clk_hf;
    logic [COUNTER_WIDTH-1:0] counter = '0;

    // ------------------------------------------------------------------------
    // iCE40 UltraPlus internal high-speed oscillator
    //
    // CLKHF_DIV:
    //   2'b00 -> 48 MHz
    //   2'b01 -> 24 MHz
    //   2'b10 -> 12 MHz
    //   2'b11 ->  6 MHz
    // ------------------------------------------------------------------------

    SB_HFOSC #(
        .CLKHF_DIV(2'b01)
    ) hfosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1),
        .CLKHF  (clk_hf)
    );

    // ------------------------------------------------------------------------
    // LED divider
    // ------------------------------------------------------------------------

    always_ff @(posedge clk_hf) begin
        if (counter == HALF_PERIOD - 1) begin
            counter <= '0;
            led     <= ~led;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end

endmodule