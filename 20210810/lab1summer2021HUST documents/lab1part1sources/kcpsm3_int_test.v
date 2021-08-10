//
//////////////////////////////////////////////////////////////////////////////////
// Copyright © 2010, Xilinx, Inc.
// This file contains confidential and proprietary information of Xilinx, Inc. and is
// protected under U.S. and international copyright and other intellectual property laws.
//////////////////////////////////////////////////////////////////////////////////
//
// Disclaimer:
// This disclaimer is not a license and does not grant any rights to the materials
// distributed herewith. Except as otherwise provided in a valid license issued to
// you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
// MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
// DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
// INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
// OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
// (whether in contract or tort, including negligence, or under any other theory
// of liability) for any loss or damage of any kind or nature related to, arising
// under or in connection with these materials, including for any direct, or any
// indirect, special, incidental, or consequential loss or damage (including loss
// of data, profits, goodwill, or any type of loss or damage suffered as a result
// of any action brought by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-safe, or for use in any
// application requiring fail-safe performance, such as life-support or safety
// devices or systems, Class III medical devices, nuclear facilities, applications
// related to the deployment of airbags, or any other applications that could lead
// to death, personal injury, or severe property or environmental damage
// (individually and collectively, "Critical Applications"). Customer assumes the
// sole risk and liability of any use of Xilinx products in Critical Applications,
// subject only to applicable laws and regulations governing limitations on product
// liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
//
//////////////////////////////////////////////////////////////////////////////////
//
//
// KCPSM3_INT_TEST.V  -  Interrupt test for KCPSM3
//
// Ken Chapman and Nick Sawyer - Xilinx Ltd - 29th March 2010
//
//
//////////////////////////////////////////////////////////////////////////////////
//

module kcpsm3_int_test (
      counter,
      waveforms,
      interrupt_event,
      clk );

output [7:0] counter;
output [7:0] waveforms;
input        interrupt_event;
input        clk;

reg    [7:0] counter;
reg    [7:0] waveforms;
wire         interrupt_event;
wire         clk;


//
////////////////////////////////////////////////////////////////////////////////
//
// Signals used to connect KCPSM3 to program ROM and I/O logic
//
////////////////////////////////////////////////////////////////////////////////
// 

wire [9:0] 	address;
wire [17:0] instruction;
wire [7:0] 	port_id;
wire [7:0] 	out_port;
wire [7:0] 	in_port;
wire  	write_strobe;
wire  	read_strobe;
reg  		interrupt = 1'b0;
wire  	interrupt_ack;
wire  	reset;

//
////////////////////////////////////////////////////////////////////////////////
//
// Start of circuit description
//
////////////////////////////////////////////////////////////////////////////////
//

  // Inserting KCPSM3 and the program memory
	kcpsm3 processor
	(	.address(address),
		.instruction(instruction),
		.port_id(port_id),
		.write_strobe(write_strobe),
		.out_port(out_port),
    		.read_strobe(read_strobe),
    		.in_port(in_port),
    		.interrupt(interrupt),
    		.interrupt_ack(interrupt_ack),
    		.reset(reset),
    		.clk(clk));

  	int_test program
	(	.address(address),
		.instruction(instruction),
		.clk(clk));

  // Unused inputs on processor
  assign in_port = 8'b 00000000;
  assign reset = 1'b 0;

  // Adding the output registers to the processor
  always @(posedge clk) begin
    
    // waveform register at address 02
    if(port_id[1]  == 1'b 1 && write_strobe == 1'b 1) 
	begin
      	waveforms <= out_port;
	end
    
    // Interrupt Counter register at address 04
    if(port_id[2]  == 1'b 1 && write_strobe == 1'b 1) 
     	begin
      	counter <= out_port;
     	end
  end

  // Adding the interrupt input
  // Note that the initial value of interrupt (low) is  
  // defined at signal declaration.

  always @(posedge clk) begin
    if(interrupt_ack == 1'b 1) 
	begin
      	interrupt <= 1'b 0;
    	end
    else if(interrupt_event == 1'b 1) 
	begin
      	interrupt <= 1'b 1;
    	end
    else 
	begin
      	interrupt <= interrupt;
    	end
  end

endmodule

//
////////////////////////////////////////////////////////////////////////////////
//
// END OF FILE KCPSM3_INT_TEST.V
//
////////////////////////////////////////////////////////////////////////////////
//
