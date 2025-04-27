#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "setMultiLHS_llm.cu"
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
    double *dsMulti = NULL;
hipMalloc(&dsMulti, XSIZE*YSIZE);
double *dlMulti = NULL;
hipMalloc(&dlMulti, XSIZE*YSIZE);
double *diagMulti = NULL;
hipMalloc(&diagMulti, XSIZE*YSIZE);
double *duMulti = NULL;
hipMalloc(&duMulti, XSIZE*YSIZE);
double *dwMulti = NULL;
hipMalloc(&dwMulti, XSIZE*YSIZE);
double a = 2;
double b = 2;
double c = 2;
double d = 1;
double e = 1;
int nx = 1;
int batchCount = 2;
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
setMultiLHS<<<gridBlock, threadBlock>>>(dsMulti,dlMulti,diagMulti,duMulti,dwMulti,a,b,c,d,e,nx,batchCount);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
setMultiLHS<<<gridBlock, threadBlock>>>(dsMulti,dlMulti,diagMulti,duMulti,dwMulti,a,b,c,d,e,nx,batchCount);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
setMultiLHS<<<gridBlock, threadBlock>>>(dsMulti,dlMulti,diagMulti,duMulti,dwMulti,a,b,c,d,e,nx,batchCount);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}