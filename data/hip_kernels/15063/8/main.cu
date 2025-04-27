#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CombineScreen.cu"
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
    float *d_postEdge1 = NULL;
hipMalloc(&d_postEdge1, XSIZE*YSIZE);
float *d_postEdge2 = NULL;
hipMalloc(&d_postEdge2, XSIZE*YSIZE);
float *d_postGradient1 = NULL;
hipMalloc(&d_postGradient1, XSIZE*YSIZE);
float *d_postGradient2 = NULL;
hipMalloc(&d_postGradient2, XSIZE*YSIZE);
float *d_postGradient3 = NULL;
hipMalloc(&d_postGradient3, XSIZE*YSIZE);
float *d_postSobel3LR = NULL;
hipMalloc(&d_postSobel3LR, XSIZE*YSIZE);
float *d_postSobel3UD = NULL;
hipMalloc(&d_postSobel3UD, XSIZE*YSIZE);
float *d_postSmooth31 = NULL;
hipMalloc(&d_postSmooth31, XSIZE*YSIZE);
float *d_output = NULL;
hipMalloc(&d_output, XSIZE*YSIZE);
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
CombineScreen<<<gridBlock, threadBlock>>>(d_postEdge1,d_postEdge2,d_postGradient1,d_postGradient2,d_postGradient3,d_postSobel3LR,d_postSobel3UD,d_postSmooth31,d_output);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CombineScreen<<<gridBlock, threadBlock>>>(d_postEdge1,d_postEdge2,d_postGradient1,d_postGradient2,d_postGradient3,d_postSobel3LR,d_postSobel3UD,d_postSmooth31,d_output);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CombineScreen<<<gridBlock, threadBlock>>>(d_postEdge1,d_postEdge2,d_postGradient1,d_postGradient2,d_postGradient3,d_postSobel3LR,d_postSobel3UD,d_postSmooth31,d_output);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}