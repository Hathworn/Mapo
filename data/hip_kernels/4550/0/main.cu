#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "hotspotOpt1.cu"
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
    float *p = NULL;
hipMalloc(&p, XSIZE*YSIZE);
float *tIn = NULL;
hipMalloc(&tIn, XSIZE*YSIZE);
float *tOut = NULL;
hipMalloc(&tOut, XSIZE*YSIZE);
float sdc = 1;
int nx = 1;
int ny = 1;
int nz = 1;
float ce = 1;
float cw = 1;
float cn = 1;
float cs = 1;
float ct = 1;
float cb = 1;
float cc = 1;
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
hotspotOpt1<<<gridBlock, threadBlock>>>(p,tIn,tOut,sdc,nx,ny,nz,ce,cw,cn,cs,ct,cb,cc);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
hotspotOpt1<<<gridBlock, threadBlock>>>(p,tIn,tOut,sdc,nx,ny,nz,ce,cw,cn,cs,ct,cb,cc);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
hotspotOpt1<<<gridBlock, threadBlock>>>(p,tIn,tOut,sdc,nx,ny,nz,ce,cw,cn,cs,ct,cb,cc);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}