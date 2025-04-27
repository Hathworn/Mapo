#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "find_advection_point_location_cuda_llm.cu"
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
    double *x = NULL;
hipMalloc(&x, XSIZE*YSIZE);
double *y = NULL;
hipMalloc(&y, XSIZE*YSIZE);
double *xadv = NULL;
hipMalloc(&xadv, XSIZE*YSIZE);
double *yadv = NULL;
hipMalloc(&yadv, XSIZE*YSIZE);
unsigned int nx = 1;
unsigned int ny = 1;
unsigned int *cellx = NULL;
hipMalloc(&cellx, XSIZE*YSIZE);
unsigned int *celly = NULL;
hipMalloc(&celly, XSIZE*YSIZE);
unsigned int *tracker = NULL;
hipMalloc(&tracker, XSIZE*YSIZE);
double xlim1 = 1;
double xlim2 = 1;
double ylim1 = 1;
double ylim2 = 1;
unsigned int TileSize = 1;
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
find_advection_point_location_cuda<<<gridBlock, threadBlock>>>(x,y,xadv,yadv,nx,ny,cellx,celly,tracker,xlim1,xlim2,ylim1,ylim2,TileSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
find_advection_point_location_cuda<<<gridBlock, threadBlock>>>(x,y,xadv,yadv,nx,ny,cellx,celly,tracker,xlim1,xlim2,ylim1,ylim2,TileSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
find_advection_point_location_cuda<<<gridBlock, threadBlock>>>(x,y,xadv,yadv,nx,ny,cellx,celly,tracker,xlim1,xlim2,ylim1,ylim2,TileSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}