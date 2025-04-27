#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "reorderData_llm.cu"
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
    uint startbit = 1;
uint *outKeys = NULL;
hipMalloc(&outKeys, XSIZE*YSIZE);
uint *outValues = NULL;
hipMalloc(&outValues, XSIZE*YSIZE);
uint2 *keys = NULL;
hipMalloc(&keys, XSIZE*YSIZE);
uint2 *values = NULL;
hipMalloc(&values, XSIZE*YSIZE);
uint *blockOffsets = NULL;
hipMalloc(&blockOffsets, XSIZE*YSIZE);
uint *offsets = NULL;
hipMalloc(&offsets, XSIZE*YSIZE);
uint *sizes = NULL;
hipMalloc(&sizes, XSIZE*YSIZE);
uint totalBlocks = 1;
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
reorderData<<<gridBlock, threadBlock>>>(startbit,outKeys,outValues,keys,values,blockOffsets,offsets,sizes,totalBlocks);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
reorderData<<<gridBlock, threadBlock>>>(startbit,outKeys,outValues,keys,values,blockOffsets,offsets,sizes,totalBlocks);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
reorderData<<<gridBlock, threadBlock>>>(startbit,outKeys,outValues,keys,values,blockOffsets,offsets,sizes,totalBlocks);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}