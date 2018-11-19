module control_unit(opcode, Jump, EX, MEM, WB);
	input [5:0] opcode;

	output reg Jump;
	output reg [3:0] EX; 
	output reg [2:0] MEM; 
	output reg [1:0] WB; 	
	always@ (opcode) begin
		if (opcode == 0) begin // for all R-type instructions
			/* about EX:
			[0] = 1 -> r[rs] (command) r[rt]
			[2:1] = 2b'10 -> for R-types
			[3] = 0 -> destination is r[rd]
			*/
			EX <= 4'b1100;
			/* about MEM:
			[0] = 0 -> don't write DM
			[1] = 0 -> don't read DM
			[2] = 0 -> pc = pc + 4
			*/
			MEM <= 3'b000;
			/* about WB:
			first bit is 1 to use alu result
			second bit is 1 to register write
			*/
			WB <= 2'b11;
		end
		else if (opcode == 4'b001000) begin // addi r[rt] = r[rs] + SignExtImm
		// todo implement
			/* about EX:
			[0] = 0 -> use SignExtImm + r[rs]
			[2:1] = 2'b00 -> for I-types
			[3] = 1 - > destination is r[rt], since we don't have r[rd]
			*/
			EX <= 4'b0001;
			/* about MEM:
			[0] = 0 -> don't write DM
			[1] = 0 -> don't read DM
			[2] = 0 -> pc = pc + 4
			*/
			MEM <= 3'b000;
		end
	end
//complete the code
	

endmodule
