#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "output_index.cu"
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
    int *device_hist = NULL;
hipMalloc(&device_hist, XSIZE*YSIZE);
int *pdevice_hist = NULL;
hipMalloc(&pdevice_hist, XSIZE*YSIZE);
int *device_input = NULL;
hipMalloc(&device_input, XSIZE*YSIZE);
int *device_out = NULL;
hipMalloc(&device_out, XSIZE*YSIZE);
int length = 1;
int num_blocks = 1;
int nibble = 1;
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
output_index<<<gridBlock, threadBlock>>>(device_hist,pdevice_hist,device_input,device_out,length,num_blocks,nibble);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
output_index<<<gridBlock, threadBlock>>>(device_hist,pdevice_hist,device_input,device_out,length,num_blocks,nibble);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
output_index<<<gridBlock, threadBlock>>>(device_hist,pdevice_hist,device_input,device_out,length,num_blocks,nibble);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}