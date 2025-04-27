#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "pathAdjacencyKernel.cu"
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
    int noTransitions = 1;
int noSegments = 1;
float *XY1 = NULL;
hipMalloc(&XY1, XSIZE*YSIZE);
float *XY2 = NULL;
hipMalloc(&XY2, XSIZE*YSIZE);
float *X4_X3 = NULL;
hipMalloc(&X4_X3, XSIZE*YSIZE);
float *Y4_Y3 = NULL;
hipMalloc(&Y4_Y3, XSIZE*YSIZE);
float *X2_X1 = NULL;
hipMalloc(&X2_X1, XSIZE*YSIZE);
float *Y2_Y1 = NULL;
hipMalloc(&Y2_Y1, XSIZE*YSIZE);
int *adjacency = NULL;
hipMalloc(&adjacency, XSIZE*YSIZE);
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
pathAdjacencyKernel<<<gridBlock, threadBlock>>>(noTransitions,noSegments,XY1,XY2,X4_X3,Y4_Y3,X2_X1,Y2_Y1,adjacency);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
pathAdjacencyKernel<<<gridBlock, threadBlock>>>(noTransitions,noSegments,XY1,XY2,X4_X3,Y4_Y3,X2_X1,Y2_Y1,adjacency);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
pathAdjacencyKernel<<<gridBlock, threadBlock>>>(noTransitions,noSegments,XY1,XY2,X4_X3,Y4_Y3,X2_X1,Y2_Y1,adjacency);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}