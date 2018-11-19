module control_unit(opcode, Jump, EX, MEM, WB);
	input [5:0] opcode;

	output reg Jump;
	output reg [3:0] EX; 
	output reg [2:0] MEM; 
	output reg [1:0] WB; 	
	always@ (opcode) begin
		if (opcode == 0) begin // for all R-type instructions
			/* about EX:
			first bit is 1 to use register RT for alu commands
			[2:1] is 2b'10 for alu control center
			last bit is 1 to use register RD as destination	to write
			*/
			EX <= 4'b1101;
			/* about MEM:
			first bit is 0 to don't write to memory
			second bit is 0 to don't read from memory
			third bit is 0 to don't jump anywere, just pc + 4
			*/
			MEM <= 3'b000;
			/* about WB:
			first bit is 1 to use alu result
			second bit is 1 to register write
			*/
			WB <= 2'b11;
		end	
	end
//complete the code
	

endmodule
