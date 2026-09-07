`timescale 1 ns/1 ns

module lab1_ei_tb();
  logic           clk;    // system clock
  logic           reset;  // active high reset
  logic   [3:0]   s;      // 4-bit input switches
  logic   [6:0]   seg;
  logic   [2:0]   led;    // 3 output leds

    lab1_ei dut (
        .s(s),
        .reset(reset),
        .seg(seg),
        .led(led),
		.clk(clk)
    );

  // apply stimuli and check outputs (checking assign logic)
  initial begin
    reset = 0;
    #40 reset = 1;

// check that HSOSC produces a clock
    #1;
	assert (clk == 0)       // check outputs
			$display("PASSED! The HSOSC produces a clk as desired at time: %0t.", $time);
		else 
			$error("FAILED! The HSOSC produces a clk incorrectly at time: %0t.", $time); 
	#11;
	
	assert (clk == 1)       // check outputs
			$display("PASSED! The HSOSC produces a clk as desired at time: %0t.", $time);
		else 
			$error("FAILED! The HSOSC produces a clk incorrectly at time: %0t.", $time); 
	#11;

// checking that the modules are wired together correctly
	#20 reset = 0;
// Counter module testing connection
	#200000000 // waiting for 48 MHz for counter to activate
	
	#20
	assert (led[2] == 1)       // check outputs
				$display("PASSED! The counter module connection behaves as desired at time: %0t.", $time);
			else 
				$error("FAILED! The counter module connection behaves incorrectly at time: %0t.", $time); 
	
	#200000000 // waiting for 48 MHz for counter to activate
	assert (led[2] == 0)       // check outputs
					$display("PASSED! The counter module connection behaves as desired at time: %0t.", $time);
				else 
					$error("FAILED! The counter module connection behaves incorrectly at time: %0t.", $time); 

// 7-seg decoder module testing connection
    // test 1 - 0
        s = 4'b0000;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1000000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 
            
    // test 2 - 1
        s = 4'b0001;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111001)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 3 - 2
        s = 4'b0010;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0100100)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 4 - 3
        s = 4'b0011;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0110000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 5 - 4
        s = 4'b0100;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0011001)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 6 - 5
        s = 4'b0101;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0010010)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 7 - 6
        s = 4'b0110;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0000010)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 8 - 7
        s = 4'b0111;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b1111000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 9 - 8
        s = 4'b1000;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0000000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 10 - 9
        s = 4'b1001;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0011000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 11 - A
        s = 4'b1010;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0001000)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 12 - b
        s = 4'b1011;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0000011)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 13 - c
        s = 4'b1100;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0100111)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 14 - d
        s = 4'b1101;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0100001)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 15 - E
        s = 4'b1110;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0000110)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 

            
    // test 16 - F
        s = 4'b1111;                // setup inputs
        #10;                        // wait required time
        assert (seg == 7'b0001110)       // check outputs
            $display("PASSED! The seven-segment decoder connection behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The seven-segment decoder connection behaves incorrectly at time: %0t.", $time); 



// testing assign logic for led[1] and led[0]
	
//led[0]

	// test 1
        s = 4'bxx00;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	
	// test 2
        s = 4'bxx01;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	
	// test 3
        s = 4'bxx10;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
	
	// test 4
        s = 4'bxx11;                // setup inputs
        #10;                        // wait required time
        assert (led[0] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 

// led[1]

    // test 1
        s = 4'b00xx;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
    
    // test 2
        s = 4'b01xx;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
       
	// test 3
        s = 4'b10xx;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b0)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
			
	// test 1
        s = 4'b11xx;                // setup inputs
        #10;                        // wait required time
        assert (led[1] == 1'b1)       // check outputs
            $display("PASSED! The led controller behaves as desired at time: %0t.", $time);
        else 
            $error("FAILED! The led controller behaves incorrectly at time: %0t.", $time); 
        

    #100 $stop;
  end
endmodule