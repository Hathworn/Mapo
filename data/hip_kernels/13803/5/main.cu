#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "reduce_fields.cu"
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
    float *d_rho = NULL;
hipMalloc(&d_rho, XSIZE*YSIZE);
float *d_Ex = NULL;
hipMalloc(&d_Ex, XSIZE*YSIZE);
float *d_Ey = NULL;
hipMalloc(&d_Ey, XSIZE*YSIZE);
float *d_Ez = NULL;
hipMalloc(&d_Ez, XSIZE*YSIZE);
float *d_Rrho = NULL;
hipMalloc(&d_Rrho, XSIZE*YSIZE);
float *d_REx = NULL;
hipMalloc(&d_REx, XSIZE*YSIZE);
float *d_REy = NULL;
hipMalloc(&d_REy, XSIZE*YSIZE);
float *d_REz = NULL;
hipMalloc(&d_REz, XSIZE*YSIZE);
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
reduce_fields<<<gridBlock, threadBlock>>>(d_rho,d_Ex,d_Ey,d_Ez,d_Rrho,d_REx,d_REy,d_REz,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
reduce_fields<<<gridBlock, threadBlock>>>(d_rho,d_Ex,d_Ey,d_Ez,d_Rrho,d_REx,d_REy,d_REz,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
reduce_fields<<<gridBlock, threadBlock>>>(d_rho,d_Ex,d_Ey,d_Ez,d_Rrho,d_REx,d_REy,d_REz,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}