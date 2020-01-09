#include "xparameters.h"
#include "xil_io.h"
#include "xbasic_types.h"
#include "stdio.h"

int main(){

	u32 system_out;

	xil_printf("Start of Smart Watering System Simulation \n\n\r");

	printf("HELLO");
	// We have the following convention for the inputs:
	//								   	RESET is  the LSB
	//									T is  the 2nd LSB
	// 									L is  the 3rd LSB
	//									M is  the bits from 4 up to 6
	// 00000000000000000000000000MMMLTR

	// For the output we have:	 		Y for the first two LSB
	//							 		Z on the 3rd LSB
	// 00000000000000000000000000000ZYY

//
	// Test I.
		//RESET=1
		//T=0
		//L=0
		//M=0
	//Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000001);
	// The expected output is Z=0 Y=3 in hex is 3
	//system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	//xil_printf("Case I. when R=1, T=0, L=0, M=0 then OUTPUT=%x\n\r",system_out);

	/*
	// Test II.
		//RESET=0
		//T=1
		//L=0
		//M=2
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000012);
	// The expected output is Z=0 Y=0 in hex is 0
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case II. when R=0, T=1, L=0, M=2 then OUTPUT=%x\n\r",system_out);

	// Test III.
		//RESET=0
		//T=0
		//L=0
		//M=4
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000020);
	// The expected output is Z=0 Y=0 in hex is 0
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case III. when R=0, T=0, L=0, M=4 then OUTPUT=%x\n\r",system_out);

	// Test IV.
		//RESET=0
		//T=0
		//L=0
		//M=3
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000018);
	// The expected output is Z=1 Y=1 in hex is 5
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=0, L=0, M=3 then OUTPUT=%x\n\r",system_out);

	// Test V.
		//RESET=0
		//T=0
		//L=0
		//M=5
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000028);
	// The expected output is Z=1 Y=1 in hex is 5
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=0, L=0, M=5 then OUTPUT=%x\n\r",system_out);

	// Test VI.
		//RESET=0
		//T=0
		//L=0
		//M=7
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x00000038);
	// The expected output is Z=0 Y=0 in hex is 0
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=0, L=0, M=7 then OUTPUT=%x\n\r",system_out);

	// Test VII.
		//RESET=0
		//T=1
		//L=0
		//M=1
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x0000000A);
	// The expected output is Z=1 Y=1 in hex is 5
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=1, L=0, M=1 then OUTPUT=%x\n\r",system_out);

	// Test VIII.
		//RESET=0
		//T=0
		//L=1
		//M=2
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x0000000C);
	// The expected output is Z=1 Y=1 in hex is 5
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=0, L=1, M=2 then OUTPUT=%x\n\r",system_out);

	// Test IX.
		//RESET=0
		//T=1
		//L=0
		//M=3
	Xil_Out32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR, 0x0000001A);
	// The expected output is Z=0 Y=0 in hex is 0
	system_out = Xil_In32(XPAR_WATERINGSYSTEM_IP_0_S00_AXI_BASEADDR+4);
	xil_printf("Case IV. when R=0, T=1, L=0, M=3 then OUTPUT=%x\n\r",system_out);
	*/

	return 0;

}
