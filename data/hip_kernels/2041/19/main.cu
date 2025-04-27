#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_normalize_and_add_to_output.cu"
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
    float *dev_vol_in = NULL;
hipMalloc(&dev_vol_in, XSIZE*YSIZE);
float *dev_vol_out = NULL;
hipMalloc(&dev_vol_out, XSIZE*YSIZE);
float *dev_accumulate_weights = NULL;
hipMalloc(&dev_accumulate_weights, XSIZE*YSIZE);
float *dev_accumulate_values = NULL;
hipMalloc(&dev_accumulate_values, XSIZE*YSIZE);
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
kernel_normalize_and_add_to_output<<<gridBlock, threadBlock>>>(dev_vol_in,dev_vol_out,dev_accumulate_weights,dev_accumulate_values);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_normalize_and_add_to_output<<<gridBlock, threadBlock>>>(dev_vol_in,dev_vol_out,dev_accumulate_weights,dev_accumulate_values);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_normalize_and_add_to_output<<<gridBlock, threadBlock>>>(dev_vol_in,dev_vol_out,dev_accumulate_weights,dev_accumulate_values);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}