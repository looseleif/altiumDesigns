`include "mipspipe_mp3.v"
  
module test_mipspipe;
  
  reg clock;
  reg [4:0] clock_cycle;

// instantiate pipeline module
  mipspipe_mp3 u_mipspipe_mp3(clock);
 
// initialize clock and cycle counter 
  initial begin
    clock = 0;
    clock_cycle=4'h0;
    #160  $finish;
  end
  
// 10 unit clock cycle
  always 
    #5 clock = ~clock;

  always @(posedge clock)
     begin
       clock_cycle=clock_cycle+1;
     end


// display contents of pipeline latches at the end of each clock cycle
  always @(negedge clock) 
     begin
     $display("\n\nclock cycle = %d",clock_cycle," (time = %1.0t)",$time);
     $display("IF/ID registers\n\t IF/ID.PC+4 = %h, IF/ID.IR = %h \n", u_mipspipe_mp3.PC, u_mipspipe_mp3.IFIDIR); 
     $display("ID/EX registers\n\t ID/EX.rs = %d, ID/EX.rt = %d",u_mipspipe_mp3.IDEXrs,u_mipspipe_mp3.IDEXrt,"\n\t ID/EX.A = %h, ID/EX.B = %h",u_mipspipe_mp3.IDEXA,u_mipspipe_mp3.IDEXB);
     $display("\t ID/EX.op = %h\n",u_mipspipe_mp3.IDEXop);
     $display("EX/MEM registers\n\t EX/MEM.rs = %d, EX/MEM.rt = %d",u_mipspipe_mp3.IDEXrs,u_mipspipe_mp3.IDEXrt,"\n\t EX/MEM.ALUOut = %h, EX/MEM.ALUout = %h",u_mipspipe_mp3.EXMEMALUOut,u_mipspipe_mp3.EXMEMB);
     $display("\t EX/MEM.op = %h\n",u_mipspipe_mp3.EXMEMop);
     $display("MEM/WB registers\n\t MEM/WB.rd = %d, MEM/WB.rt = %d",u_mipspipe_mp3.MEMWBrd,u_mipspipe_mp3.MEMWBrt,"\n\t MEM/WB.value = %h",u_mipspipe_mp3.MEMWBValue);
     $display("\t EX/MEM.op = %h\n",u_mipspipe_mp3.MEMWBop);
     
     // Used for Debugging Purposes
     
     $display("DMemory[0] = %h\n",u_mipspipe_mp3.DMemory[0]);
     $display("DMemory[1] = %h\n",u_mipspipe_mp3.DMemory[1]);
     $display("DMemory[2] = %h\n",u_mipspipe_mp3.DMemory[2]);
     $display("DMemory[3] = %h\n",u_mipspipe_mp3.DMemory[3]);
     $display("DMemory[4] = %h\n",u_mipspipe_mp3.DMemory[4]);
     $display("DMemory[5] = %h\n",u_mipspipe_mp3.DMemory[5]);
     $display("DMemory[6] = %h\n",u_mipspipe_mp3.DMemory[6]);
     $display("DMemory[7] = %h\n",u_mipspipe_mp3.DMemory[7]);
     
     
     /* Unnecessary Additions for Debug
     
     $display("DMemory[8] = %h\n",u_mipspipe_mp3.DMemory[8]);
     $display("DMemory[9] = %h\n",u_mipspipe_mp3.DMemory[9]);
     $display("DMemory[10] = %h\n",u_mipspipe_mp3.DMemory[10]);
     $display("DMemory[11] = %h\n",u_mipspipe_mp3.DMemory[11]);
     $display("DMemory[12] = %h\n",u_mipspipe_mp3.DMemory[12]);
     $display("DMemory[13] = %h\n",u_mipspipe_mp3.DMemory[13]);
     $display("DMemory[14] = %h\n",u_mipspipe_mp3.DMemory[14]);
     $display("DMemory[15] = %h\n",u_mipspipe_mp3.DMemory[15]);
     $display("DMemory[16] = %h\n",u_mipspipe_mp3.DMemory[16]);
     $display("DMemory[32] = %h\n",u_mipspipe_mp3.DMemory[32]);
     
     */
     
     $display("Regs[0] = %h\n",u_mipspipe_mp3.Regs[0]);
     $display("Regs[1] = %h\n",u_mipspipe_mp3.Regs[1]);
     $display("Regs[2] = %h\n",u_mipspipe_mp3.Regs[2]);
     $display("Regs[3] = %h\n",u_mipspipe_mp3.Regs[3]);
     $display("Regs[4] = %h\n",u_mipspipe_mp3.Regs[4]);
     $display("Regs[5] = %h\n",u_mipspipe_mp3.Regs[5]);
     $display("Regs[6] = %h\n",u_mipspipe_mp3.Regs[6]);
     $display("Regs[7] = %h\n",u_mipspipe_mp3.Regs[7]);
     $display("Regs[8] = %h\n",u_mipspipe_mp3.Regs[8]);
     $display("Regs[9] = %h\n",u_mipspipe_mp3.Regs[9]);
     $display("Regs[10] = %h\n",u_mipspipe_mp3.Regs[10]);
     $display("Regs[11] = %h\n",u_mipspipe_mp3.Regs[11]);
     $display("Regs[12] = %h\n",u_mipspipe_mp3.Regs[12]);
     
     end
      
// log to a vcd (variable change dump) file
   initial
      begin
      $dumpfile("test_mipspipe.vcd");
      $dumpvars;
   end

endmodule
