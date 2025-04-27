#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cvlUnit.cu"
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
    const char *imgR = NULL;
hipMalloc(&imgR, XSIZE*YSIZE);
const char *imgG = NULL;
hipMalloc(&imgG, XSIZE*YSIZE);
const char *imgB = NULL;
hipMalloc(&imgB, XSIZE*YSIZE);
const char *core = NULL;
hipMalloc(&core, XSIZE*YSIZE);
char *outR = NULL;
hipMalloc(&outR, XSIZE*YSIZE);
char *outG = NULL;
hipMalloc(&outG, XSIZE*YSIZE);
char *outB = NULL;
hipMalloc(&outB, XSIZE*YSIZE);
int lenX = 1;
int lenY = 1;
int lenCore = 1;
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
cvlUnit<<<gridBlock, threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cvlUnit<<<gridBlock, threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cvlUnit<<<gridBlock, threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}