#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scatter_kernel_llm.cu"
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
    unsigned int *d_inputVals = NULL;
hipMalloc(&d_inputVals, XSIZE*YSIZE);
unsigned int *d_inputPos = NULL;
hipMalloc(&d_inputPos, XSIZE*YSIZE);
unsigned int *d_outputVals = NULL;
hipMalloc(&d_outputVals, XSIZE*YSIZE);
unsigned int *d_outputPos = NULL;
hipMalloc(&d_outputPos, XSIZE*YSIZE);
unsigned int *cu_outputVals = NULL;
hipMalloc(&cu_outputVals, XSIZE*YSIZE);
size_t numElems = 1;
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
scatter_kernel<<<gridBlock, threadBlock>>>(d_inputVals,d_inputPos,d_outputVals,d_outputPos,cu_outputVals,numElems);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scatter_kernel<<<gridBlock, threadBlock>>>(d_inputVals,d_inputPos,d_outputVals,d_outputPos,cu_outputVals,numElems);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scatter_kernel<<<gridBlock, threadBlock>>>(d_inputVals,d_inputPos,d_outputVals,d_outputPos,cu_outputVals,numElems);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}