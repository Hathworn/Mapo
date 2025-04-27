#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "fill_bspline_4.cu"
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
    const float4 *xyzq = NULL;
hipMalloc(&xyzq, XSIZE*YSIZE);
const int ncoord = 1;
const float *recip = NULL;
hipMalloc(&recip, XSIZE*YSIZE);
const int nfftx = 1;
const int nffty = 1;
const int nfftz = 1;
int *gix = NULL;
hipMalloc(&gix, XSIZE*YSIZE);
int *giy = NULL;
hipMalloc(&giy, XSIZE*YSIZE);
int *giz = NULL;
hipMalloc(&giz, XSIZE*YSIZE);
float *charge = NULL;
hipMalloc(&charge, XSIZE*YSIZE);
float *thetax = NULL;
hipMalloc(&thetax, XSIZE*YSIZE);
float *thetay = NULL;
hipMalloc(&thetay, XSIZE*YSIZE);
float *thetaz = NULL;
hipMalloc(&thetaz, XSIZE*YSIZE);
float *dthetax = NULL;
hipMalloc(&dthetax, XSIZE*YSIZE);
float *dthetay = NULL;
hipMalloc(&dthetay, XSIZE*YSIZE);
float *dthetaz = NULL;
hipMalloc(&dthetaz, XSIZE*YSIZE);
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
fill_bspline_4<<<gridBlock, threadBlock>>>(xyzq,ncoord,recip,nfftx,nffty,nfftz,gix,giy,giz,charge,thetax,thetay,thetaz,dthetax,dthetay,dthetaz);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
fill_bspline_4<<<gridBlock, threadBlock>>>(xyzq,ncoord,recip,nfftx,nffty,nfftz,gix,giy,giz,charge,thetax,thetay,thetaz,dthetax,dthetay,dthetaz);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
fill_bspline_4<<<gridBlock, threadBlock>>>(xyzq,ncoord,recip,nfftx,nffty,nfftz,gix,giy,giz,charge,thetax,thetay,thetaz,dthetax,dthetay,dthetaz);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}