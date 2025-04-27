#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "patchComputation.cu"
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
    int noCandidates = 1;
int W = XSIZE;
int H = YSIZE;
int skpx = 1;
int skpy = 1;
int xres = 1;
int yres = 1;
float subPatchArea = 1;
float xspacing = 1;
float yspacing = 1;
float capacity = 1;
int uniqueRegions = 1;
const int *labelledImage = NULL;
hipMalloc(&labelledImage, XSIZE*YSIZE);
const float *pops = NULL;
hipMalloc(&pops, XSIZE*YSIZE);
float *results = NULL;
hipMalloc(&results, XSIZE*YSIZE);
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
patchComputation<<<gridBlock, threadBlock>>>(noCandidates,W,H,skpx,skpy,xres,yres,subPatchArea,xspacing,yspacing,capacity,uniqueRegions,labelledImage,pops,results);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
patchComputation<<<gridBlock, threadBlock>>>(noCandidates,W,H,skpx,skpy,xres,yres,subPatchArea,xspacing,yspacing,capacity,uniqueRegions,labelledImage,pops,results);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
patchComputation<<<gridBlock, threadBlock>>>(noCandidates,W,H,skpx,skpy,xres,yres,subPatchArea,xspacing,yspacing,capacity,uniqueRegions,labelledImage,pops,results);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}