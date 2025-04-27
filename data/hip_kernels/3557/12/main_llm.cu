#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaSgatherI2I_kernel_llm.cu"
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
    const int *keys = NULL;
hipMalloc(&keys, XSIZE*YSIZE);
const int *indicesX = NULL;
hipMalloc(&indicesX, XSIZE*YSIZE);
const int *indicesY = NULL;
hipMalloc(&indicesY, XSIZE*YSIZE);
const int *indicesK = NULL;
hipMalloc(&indicesK, XSIZE*YSIZE);
int *outX = NULL;
hipMalloc(&outX, XSIZE*YSIZE);
int *outY = NULL;
hipMalloc(&outY, XSIZE*YSIZE);
int *outK = NULL;
hipMalloc(&outK, XSIZE*YSIZE);
unsigned int nbElements = 1;
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
cudaSgatherI2I_kernel<<<gridBlock, threadBlock>>>(keys,indicesX,indicesY,indicesK,outX,outY,outK,nbElements);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaSgatherI2I_kernel<<<gridBlock, threadBlock>>>(keys,indicesX,indicesY,indicesK,outX,outY,outK,nbElements);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaSgatherI2I_kernel<<<gridBlock, threadBlock>>>(keys,indicesX,indicesY,indicesK,outX,outY,outK,nbElements);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}