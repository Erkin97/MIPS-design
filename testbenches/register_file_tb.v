module register_file_tb;
  reg rst, RegWrite;
  reg [4:0] read_reg_1, read_reg_2, write_reg;
  reg [31:0] write_data;
  wire [31:0] out_data_1, out_data_2;
  register_file rf(rst, RegWrite, read_reg_1, read_reg_2, write_reg, write_data, out_data_1, out_data_2);
  initial begin
    // check reading
    rst = 0;
    RegWrite = 0; 
    read_reg_1 = 4'd2;  // out_data_1 = register[2]
    read_reg_2 = 4'd5;  // out_data_2 = register[5]
    #100;
    $display("Output rst: %b, RegWrite: %b, read_reg_1: %d, read_reg_2: %d, write_reg: %d, write_data: %b, out_data_1: %d, out_data_2: %d", 
    rst, RegWrite, read_reg_1, read_reg_2, write_reg, write_data, out_data_1, out_data_2);
    // check writing
    RegWrite = 1;
    rst = 1;
    write_reg = 4'd2;
    write_data = 32'd25;
    #100;
    $display("Output rst: %b, RegWrite: %b, read_reg_1: %d, read_reg_2: %d, write_reg: %d, write_data: %b, out_data_1: %d, out_data_2: %d", 
    rst, RegWrite, read_reg_1, read_reg_2, write_reg, write_data, out_data_1, out_data_2);
    RegWrite = 1;
    rst = 1;
    write_reg = 4'd5;
    write_data = 32'd25;
    #100;
    $display("Output rst: %b, RegWrite: %b, read_reg_1: %d, read_reg_2: %d, write_reg: %d, write_data: %b, out_data_1: %d, out_data_2: %d", 
    rst, RegWrite, read_reg_1, read_reg_2, write_reg, write_data, out_data_1, out_data_2);
  end
endmodule