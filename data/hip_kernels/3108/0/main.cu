#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "force.cu"
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
    double *deviceq = NULL;
hipMalloc(&deviceq, XSIZE*YSIZE);
double *devicex = NULL;
hipMalloc(&devicex, XSIZE*YSIZE);
double *devicey = NULL;
hipMalloc(&devicey, XSIZE*YSIZE);
double *devicez = NULL;
hipMalloc(&devicez, XSIZE*YSIZE);
double *deviceFx = NULL;
hipMalloc(&deviceFx, XSIZE*YSIZE);
double *deviceFy = NULL;
hipMalloc(&deviceFy, XSIZE*YSIZE);
double *deviceFz = NULL;
hipMalloc(&deviceFz, XSIZE*YSIZE);
double *deviceU = NULL;
hipMalloc(&deviceU, XSIZE*YSIZE);
int N = XSIZE*YSIZE;
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
force<<<gridBlock, threadBlock>>>(deviceq,devicex,devicey,devicez,deviceFx,deviceFy,deviceFz,deviceU,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
force<<<gridBlock, threadBlock>>>(deviceq,devicex,devicey,devicez,deviceFx,deviceFy,deviceFz,deviceU,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
force<<<gridBlock, threadBlock>>>(deviceq,devicex,devicey,devicez,deviceFx,deviceFy,deviceFz,deviceU,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}