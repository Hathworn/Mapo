#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "NewNodeConnectionKernel.cu"
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
    int f = 1;
int q = 1;
int r = 1;
int *activityFlag = NULL;
hipMalloc(&activityFlag, XSIZE*YSIZE);
int *connection = NULL;
hipMalloc(&connection, XSIZE*YSIZE);
int *age = NULL;
hipMalloc(&age, XSIZE*YSIZE);
float *localError = NULL;
hipMalloc(&localError, XSIZE*YSIZE);
float alfa = 1;
int maxCells = 1;
float errorFraction = 1;
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
NewNodeConnectionKernel<<<gridBlock, threadBlock>>>(f,q,r,activityFlag,connection,age,localError,alfa,maxCells,errorFraction);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
NewNodeConnectionKernel<<<gridBlock, threadBlock>>>(f,q,r,activityFlag,connection,age,localError,alfa,maxCells,errorFraction);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
NewNodeConnectionKernel<<<gridBlock, threadBlock>>>(f,q,r,activityFlag,connection,age,localError,alfa,maxCells,errorFraction);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}