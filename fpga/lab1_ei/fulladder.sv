// fulladder.sv
// Structural Verilog full adder
// 5/26/22
// Josh Brake
// jbrake@hmc.edu

module fulladder(
 input   logic A, B, Cin,
 output  logic S, Cout
);

 logic n1, n2, n3;

 xor g1(n1, A, B);
 xor g2(S, n1, Cin);

 and g3(n2, n1, Cin);
 and g4(n3, A, B);

 or  g5(Cout, n2, n3);

endmodule
