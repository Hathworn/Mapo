#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gMaxPoolingBackward_llm.cu"
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
    float *adj = NULL;
hipMalloc(&adj, XSIZE*YSIZE);
int adjRows = 1;
int adjCols = 1;
float *in = NULL;
hipMalloc(&in, XSIZE*YSIZE);
float *adjIn = NULL;
hipMalloc(&adjIn, XSIZE*YSIZE);
int inRows = 1;
int inCols = 1;
float *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
int numKernels = 1;
int maskCols = 1;
int width = XSIZE;
int lastWidth = XSIZE;
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
gMaxPoolingBackward<<<gridBlock, threadBlock>>>(adj,adjRows,adjCols,in,adjIn,inRows,inCols,mask,numKernels,maskCols,width,lastWidth);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gMaxPoolingBackward<<<gridBlock, threadBlock>>>(adj,adjRows,adjCols,in,adjIn,inRows,inCols,mask,numKernels,maskCols,width,lastWidth);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gMaxPoolingBackward<<<gridBlock, threadBlock>>>(adj,adjRows,adjCols,in,adjIn,inRows,inCols,mask,numKernels,maskCols,width,lastWidth);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}