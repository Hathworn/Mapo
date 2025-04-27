#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "TgvConvertKBKernel.cu"
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
    float2 *disparity = NULL;
hipMalloc(&disparity, XSIZE*YSIZE);
float focalx = 1;
float focaly = 1;
float cx = 1;
float cy = 1;
float d1 = 2;
float d2 = 2;
float d3 = 2;
float d4 = 1;
float t1 = 1;
float t2 = 1;
float t3 = 1;
float3 *X = NULL;
hipMalloc(&X, XSIZE*YSIZE);
float *depth = NULL;
hipMalloc(&depth, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
int stride = 2;
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
TgvConvertKBKernel<<<gridBlock, threadBlock>>>(disparity,focalx,focaly,cx,cy,d1,d2,d3,d4,t1,t2,t3,X,depth,width,height,stride);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
TgvConvertKBKernel<<<gridBlock, threadBlock>>>(disparity,focalx,focaly,cx,cy,d1,d2,d3,d4,t1,t2,t3,X,depth,width,height,stride);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
TgvConvertKBKernel<<<gridBlock, threadBlock>>>(disparity,focalx,focaly,cx,cy,d1,d2,d3,d4,t1,t2,t3,X,depth,width,height,stride);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}