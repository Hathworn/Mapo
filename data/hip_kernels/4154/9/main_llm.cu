#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convertPToRGBKernel_llm.cu"
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
    const uint16_t *dpSrc = NULL;
hipMalloc(&dpSrc, XSIZE*YSIZE);
uint8_t *tt1 = NULL;
hipMalloc(&tt1, XSIZE*YSIZE);
int nSrcWidth = XSIZE;
int nDstWidth = XSIZE;
int nDstHeight = YSIZE;
int *lookupTable = NULL;
hipMalloc(&lookupTable, XSIZE*YSIZE);
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
convertPToRGBKernel<<<gridBlock, threadBlock>>>(dpSrc,tt1,nSrcWidth,nDstWidth,nDstHeight,lookupTable);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convertPToRGBKernel<<<gridBlock, threadBlock>>>(dpSrc,tt1,nSrcWidth,nDstWidth,nDstHeight,lookupTable);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convertPToRGBKernel<<<gridBlock, threadBlock>>>(dpSrc,tt1,nSrcWidth,nDstWidth,nDstHeight,lookupTable);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}