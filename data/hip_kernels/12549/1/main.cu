#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "trianguler_convolution_gpu_kernel.cu"
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
    float *dev_I = NULL;
hipMalloc(&dev_I, XSIZE*YSIZE);
float *dev_O = NULL;
hipMalloc(&dev_O, XSIZE*YSIZE);
float *T0 = NULL;
hipMalloc(&T0, XSIZE*YSIZE);
float *T1 = NULL;
hipMalloc(&T1, XSIZE*YSIZE);
float *T2 = NULL;
hipMalloc(&T2, XSIZE*YSIZE);
int wd = 1;
int ht = 1;
float nrm = 1;
float p = 1;
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
trianguler_convolution_gpu_kernel<<<gridBlock, threadBlock>>>(dev_I,dev_O,T0,T1,T2,wd,ht,nrm,p);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
trianguler_convolution_gpu_kernel<<<gridBlock, threadBlock>>>(dev_I,dev_O,T0,T1,T2,wd,ht,nrm,p);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
trianguler_convolution_gpu_kernel<<<gridBlock, threadBlock>>>(dev_I,dev_O,T0,T1,T2,wd,ht,nrm,p);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}