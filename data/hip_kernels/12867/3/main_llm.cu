#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "pnpoly_cnGPU1_llm.cu"
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
    const float *px = NULL;
hipMalloc(&px, XSIZE*YSIZE);
const float *py = NULL;
hipMalloc(&py, XSIZE*YSIZE);
const float *vx = NULL;
hipMalloc(&vx, XSIZE*YSIZE);
const float *vy = NULL;
hipMalloc(&vy, XSIZE*YSIZE);
char *cs = NULL;
hipMalloc(&cs, XSIZE*YSIZE);
int npoint = 1;
int nvert = 1;
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
pnpoly_cnGPU1<<<gridBlock, threadBlock>>>(px,py,vx,vy,cs,npoint,nvert);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
pnpoly_cnGPU1<<<gridBlock, threadBlock>>>(px,py,vx,vy,cs,npoint,nvert);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
pnpoly_cnGPU1<<<gridBlock, threadBlock>>>(px,py,vx,vy,cs,npoint,nvert);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}