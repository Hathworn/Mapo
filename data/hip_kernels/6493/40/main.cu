#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "chooseLaw.cu"
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
    const int nwl = 1;
const int *kex = NULL;
hipMalloc(&kex, XSIZE*YSIZE);
const float *didi11 = NULL;
hipMalloc(&didi11, XSIZE*YSIZE);
const float *didi12 = NULL;
hipMalloc(&didi12, XSIZE*YSIZE);
const float *didi13 = NULL;
hipMalloc(&didi13, XSIZE*YSIZE);
float *didi1 = NULL;
hipMalloc(&didi1, XSIZE*YSIZE);
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
chooseLaw<<<gridBlock, threadBlock>>>(nwl,kex,didi11,didi12,didi13,didi1);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
chooseLaw<<<gridBlock, threadBlock>>>(nwl,kex,didi11,didi12,didi13,didi1);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
chooseLaw<<<gridBlock, threadBlock>>>(nwl,kex,didi11,didi12,didi13,didi1);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}