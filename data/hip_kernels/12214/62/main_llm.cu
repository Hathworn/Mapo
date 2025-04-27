#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "exclscnmb2e_llm.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    int *d_data0 = NULL;
hipMalloc(&d_data0, XSIZE*YSIZE);
int *d_output0 = NULL;
hipMalloc(&d_output0, XSIZE*YSIZE);
int *d_data1 = NULL;
hipMalloc(&d_data1, XSIZE*YSIZE);
int *d_output1 = NULL;
hipMalloc(&d_output1, XSIZE*YSIZE);
int *d_data2 = NULL;
hipMalloc(&d_data2, XSIZE*YSIZE);
int *d_output2 = NULL;
hipMalloc(&d_output2, XSIZE*YSIZE);
int *d_data3 = NULL;
hipMalloc(&d_data3, XSIZE*YSIZE);
int *d_output3 = NULL;
hipMalloc(&d_output3, XSIZE*YSIZE);
int *d_data4 = NULL;
hipMalloc(&d_data4, XSIZE*YSIZE);
int *d_output4 = NULL;
hipMalloc(&d_output4, XSIZE*YSIZE);
int *d_data5 = NULL;
hipMalloc(&d_data5, XSIZE*YSIZE);
int *d_output5 = NULL;
hipMalloc(&d_output5, XSIZE*YSIZE);
int *d_data6 = NULL;
hipMalloc(&d_data6, XSIZE*YSIZE);
int *d_output6 = NULL;
hipMalloc(&d_output6, XSIZE*YSIZE);
int *d_data7 = NULL;
hipMalloc(&d_data7, XSIZE*YSIZE);
int *d_output7 = NULL;
hipMalloc(&d_output7, XSIZE*YSIZE);
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
exclscnmb2e<<<gridBlock, threadBlock>>>(d_data0,d_output0,d_data1,d_output1,d_data2,d_output2,d_data3,d_output3,d_data4,d_output4,d_data5,d_output5,d_data6,d_output6,d_data7,d_output7);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
exclscnmb2e<<<gridBlock, threadBlock>>>(d_data0,d_output0,d_data1,d_output1,d_data2,d_output2,d_data3,d_output3,d_data4,d_output4,d_data5,d_output5,d_data6,d_output6,d_data7,d_output7);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
exclscnmb2e<<<gridBlock, threadBlock>>>(d_data0,d_output0,d_data1,d_output1,d_data2,d_output2,d_data3,d_output3,d_data4,d_output4,d_data5,d_output5,d_data6,d_output6,d_data7,d_output7);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}