#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "resizeBatchKernel_llm.cu"
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
    const uint16_t *p_Src = NULL;
hipMalloc(&p_Src, XSIZE*YSIZE);
int nSrcPitch = 2;
int nSrcHeight = YSIZE;
uint8_t *dpDst0 = NULL;
hipMalloc(&dpDst0, XSIZE*YSIZE);
uint8_t *dpDst1 = NULL;
hipMalloc(&dpDst1, XSIZE*YSIZE);
uint8_t *dpDst2 = NULL;
hipMalloc(&dpDst2, XSIZE*YSIZE);
int nDstWidth = XSIZE;
int nDstHeight = YSIZE;
int *lookupTable_cuda = NULL;
hipMalloc(&lookupTable_cuda, XSIZE*YSIZE);
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
resizeBatchKernel<<<gridBlock, threadBlock>>>(p_Src,nSrcPitch,nSrcHeight,dpDst0,dpDst1,dpDst2,nDstWidth,nDstHeight,lookupTable_cuda);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
resizeBatchKernel<<<gridBlock, threadBlock>>>(p_Src,nSrcPitch,nSrcHeight,dpDst0,dpDst1,dpDst2,nDstWidth,nDstHeight,lookupTable_cuda);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
resizeBatchKernel<<<gridBlock, threadBlock>>>(p_Src,nSrcPitch,nSrcHeight,dpDst0,dpDst1,dpDst2,nDstWidth,nDstHeight,lookupTable_cuda);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}