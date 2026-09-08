`timescale 1 ns/1 ns

// Your counter is sequential, so rather than simulating every count for example, 
// verify its reset, enable, and max count behavior.

module lab1_counter_ei_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic 		  enable; // enable behavior
  logic           led;    // 1 output led
 
  lab1_counter_ei #(.MAXCOUNT(10_000_000), .WIDTH(24)) dut (
        .clk(clk),
        .reset(reset),
		.enable(enable),
        .led(led)
    );

// generate clock
// 48 MHz = 20.83 ns, so we do 20.83/2 = 10.145 ns for clk 0 to 1
  always begin
      clk = 0; #10; // 10.145 ns is the real number, but this only takes integers.
      clk = 1; #10;
  end

 // apply stimuli and check outputs
  initial begin
    reset = 0;
    #20 reset = 1;
	// checking that the enable is off for 48 MHz for a few periods to make sure
	enable = 0;
	#40;
	assert (dut.counter == 32'd0)       // check outputs
            $display("PASSED! The counter enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter enable behaves incorrectly at time: %0t.", dut.counter, $time); 
	
	// checking that the enable is on for 48 MHz
	#40;
	enable = 1;
	
	#200000000 // waiting for 48 MHz for counter to activate
	
	assert (dut.counter == 10_000_000)       // check outputs
            $display("PASSED! The counter enable behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter enable behaves incorrectly at time: %0t.", $time); 
	
	// checking max count behavior
	#40;
	reset = 0;
    #20 reset = 1;
	
	#200000000; // one cycle is 20 ns, and we need 10,000,000 of them.
    #20;
	
	assert (dut.counter == 0)       // check outputs
            $display("PASSED! The counter max count behavior behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter max count behavior behaves incorrectly at time: %0t.", $time); 
	
	
	// checking reset behavior
	#80;
	reset = 0;
    #20 reset = 1;
	
	assert (dut.counter == 0 & led == 1'b0)       // check outputs
            $display("PASSED! The counter reset behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The counter reset behaves incorrectly at time: %0t.", $time); 
	
			
    #40; $stop;
  end
  
  
  
endmodule