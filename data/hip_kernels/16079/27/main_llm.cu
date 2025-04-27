#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "TgvMedianFilter3DKernel3_llm.cu"
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
    float *X = NULL;
hipMalloc(&X, XSIZE*YSIZE);
float *Y = NULL;
hipMalloc(&Y, XSIZE*YSIZE);
float *Z = NULL;
hipMalloc(&Z, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
int stride = 2;
float *X1 = NULL;
hipMalloc(&X1, XSIZE*YSIZE);
float *Y1 = NULL;
hipMalloc(&Y1, XSIZE*YSIZE);
float *Z1 = NULL;
hipMalloc(&Z1, XSIZE*YSIZE);
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
TgvMedianFilter3DKernel3<<<gridBlock, threadBlock>>>(X,Y,Z,width,height,stride,X1,Y1,Z1);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
TgvMedianFilter3DKernel3<<<gridBlock, threadBlock>>>(X,Y,Z,width,height,stride,X1,Y1,Z1);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
TgvMedianFilter3DKernel3<<<gridBlock, threadBlock>>>(X,Y,Z,width,height,stride,X1,Y1,Z1);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}