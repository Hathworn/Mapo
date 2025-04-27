#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "laxWendroffStep_llm.cu"
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
    const int nbrOfGrids = 1;
double *d_u1 = NULL;
hipMalloc(&d_u1, XSIZE*YSIZE);
double *d_u2 = NULL;
hipMalloc(&d_u2, XSIZE*YSIZE);
double *d_u3 = NULL;
hipMalloc(&d_u3, XSIZE*YSIZE);
double *d_u1Temp = NULL;
hipMalloc(&d_u1Temp, XSIZE*YSIZE);
double *d_u2Temp = NULL;
hipMalloc(&d_u2Temp, XSIZE*YSIZE);
double *d_u3Temp = NULL;
hipMalloc(&d_u3Temp, XSIZE*YSIZE);
double *d_f1 = NULL;
hipMalloc(&d_f1, XSIZE*YSIZE);
double *d_f2 = NULL;
hipMalloc(&d_f2, XSIZE*YSIZE);
double *d_f3 = NULL;
hipMalloc(&d_f3, XSIZE*YSIZE);
const double *d_tau = NULL;
hipMalloc(&d_tau, XSIZE*YSIZE);
const double *d_h = NULL;
hipMalloc(&d_h, XSIZE*YSIZE);
const double *d_gama = NULL;
hipMalloc(&d_gama, XSIZE*YSIZE);
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
laxWendroffStep<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_u1Temp,d_u2Temp,d_u3Temp,d_f1,d_f2,d_f3,d_tau,d_h,d_gama);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
laxWendroffStep<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_u1Temp,d_u2Temp,d_u3Temp,d_f1,d_f2,d_f3,d_tau,d_h,d_gama);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
laxWendroffStep<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_u1Temp,d_u2Temp,d_u3Temp,d_f1,d_f2,d_f3,d_tau,d_h,d_gama);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}