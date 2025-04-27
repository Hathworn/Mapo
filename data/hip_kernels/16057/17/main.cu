#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculate_IMC.cu"
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
    float *norm = NULL;
hipMalloc(&norm, XSIZE*YSIZE);
float *IMC = NULL;
hipMalloc(&IMC, XSIZE*YSIZE);
float *HX = NULL;
hipMalloc(&HX, XSIZE*YSIZE);
float *HY = NULL;
hipMalloc(&HY, XSIZE*YSIZE);
float *entropy = NULL;
hipMalloc(&entropy, XSIZE*YSIZE);
float *px = NULL;
hipMalloc(&px, XSIZE*YSIZE);
float *py = NULL;
hipMalloc(&py, XSIZE*YSIZE);
float *HXY = NULL;
hipMalloc(&HXY, XSIZE*YSIZE);
int max = 1;
float sum = 1;
int size = XSIZE*YSIZE;
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
calculate_IMC<<<gridBlock, threadBlock>>>(norm,IMC,HX,HY,entropy,px,py,HXY,max,sum,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculate_IMC<<<gridBlock, threadBlock>>>(norm,IMC,HX,HY,entropy,px,py,HXY,max,sum,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculate_IMC<<<gridBlock, threadBlock>>>(norm,IMC,HX,HY,entropy,px,py,HXY,max,sum,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}