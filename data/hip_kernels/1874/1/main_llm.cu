#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateTau_llm.cu"
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
const double *d_u1 = NULL;
hipMalloc(&d_u1, XSIZE*YSIZE);
const double *d_u2 = NULL;
hipMalloc(&d_u2, XSIZE*YSIZE);
const double *d_u3 = NULL;
hipMalloc(&d_u3, XSIZE*YSIZE);
const double *d_gama = NULL;
hipMalloc(&d_gama, XSIZE*YSIZE);
double *d_cMax = NULL;
hipMalloc(&d_cMax, XSIZE*YSIZE);
const double *d_h = NULL;
hipMalloc(&d_h, XSIZE*YSIZE);
const double *d_cfl = NULL;
hipMalloc(&d_cfl, XSIZE*YSIZE);
double *d_tau = NULL;
hipMalloc(&d_tau, XSIZE*YSIZE);
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
updateTau<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_gama,d_cMax,d_h,d_cfl,d_tau);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateTau<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_gama,d_cMax,d_h,d_cfl,d_tau);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateTau<<<gridBlock, threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_gama,d_cMax,d_h,d_cfl,d_tau);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}