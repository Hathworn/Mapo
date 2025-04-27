#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Bprop1.cu"
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
    const float *dlayer1 = NULL;
hipMalloc(&dlayer1, XSIZE*YSIZE);
const float *dlayer1i = NULL;
hipMalloc(&dlayer1i, XSIZE*YSIZE);
const float *dlayer1o = NULL;
hipMalloc(&dlayer1o, XSIZE*YSIZE);
const float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
float *dsyn1 = NULL;
hipMalloc(&dsyn1, XSIZE*YSIZE);
float *dsyn1i = NULL;
hipMalloc(&dsyn1i, XSIZE*YSIZE);
float *dsyn1o = NULL;
hipMalloc(&dsyn1o, XSIZE*YSIZE);
const float alpha = 1;
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
Bprop1<<<gridBlock, threadBlock>>>(dlayer1,dlayer1i,dlayer1o,in,dsyn1,dsyn1i,dsyn1o,alpha);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Bprop1<<<gridBlock, threadBlock>>>(dlayer1,dlayer1i,dlayer1o,in,dsyn1,dsyn1i,dsyn1o,alpha);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Bprop1<<<gridBlock, threadBlock>>>(dlayer1,dlayer1i,dlayer1o,in,dsyn1,dsyn1i,dsyn1o,alpha);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}