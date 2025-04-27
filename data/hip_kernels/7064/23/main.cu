#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gGRUFastBackward.cu"
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
    float *outState = NULL;
hipMalloc(&outState, XSIZE*YSIZE);
float *outXW = NULL;
hipMalloc(&outXW, XSIZE*YSIZE);
float *outSU = NULL;
hipMalloc(&outSU, XSIZE*YSIZE);
float *outB = NULL;
hipMalloc(&outB, XSIZE*YSIZE);
const float *state = NULL;
hipMalloc(&state, XSIZE*YSIZE);
const float *xW = NULL;
hipMalloc(&xW, XSIZE*YSIZE);
const float *sU = NULL;
hipMalloc(&sU, XSIZE*YSIZE);
const float *b = NULL;
hipMalloc(&b, XSIZE*YSIZE);
const float *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
const float *adj = NULL;
hipMalloc(&adj, XSIZE*YSIZE);
size_t rows = XSIZE;
size_t cols = YSIZE;
bool final = 1;
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
gGRUFastBackward<<<gridBlock, threadBlock>>>(outState,outXW,outSU,outB,state,xW,sU,b,mask,adj,rows,cols,final);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gGRUFastBackward<<<gridBlock, threadBlock>>>(outState,outXW,outSU,outB,state,xW,sU,b,mask,adj,rows,cols,final);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gGRUFastBackward<<<gridBlock, threadBlock>>>(outState,outXW,outSU,outB,state,xW,sU,b,mask,adj,rows,cols,final);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}