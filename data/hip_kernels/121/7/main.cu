#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kOutpTraceMultiplyImages.cu"
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
    float *expanded_images = NULL;
hipMalloc(&expanded_images, XSIZE*YSIZE);
float *expanded_derivs = NULL;
hipMalloc(&expanded_derivs, XSIZE*YSIZE);
int num_images = 1;
int num_channels = 1;
int num_modules_batch = 2;
int kernel_size = XSIZE*YSIZE;
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
kOutpTraceMultiplyImages<<<gridBlock, threadBlock>>>(expanded_images,expanded_derivs,num_images,num_channels,num_modules_batch,kernel_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kOutpTraceMultiplyImages<<<gridBlock, threadBlock>>>(expanded_images,expanded_derivs,num_images,num_channels,num_modules_batch,kernel_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kOutpTraceMultiplyImages<<<gridBlock, threadBlock>>>(expanded_images,expanded_derivs,num_images,num_channels,num_modules_batch,kernel_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}