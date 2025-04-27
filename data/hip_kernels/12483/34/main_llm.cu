#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "jacobi_init_llm.cu"
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
    const int x_inner = 1;
const int y_inner = 1;
const int halo_depth = 1;
const double *density = NULL;
hipMalloc(&density, XSIZE*YSIZE);
const double *energy = NULL;
hipMalloc(&energy, XSIZE*YSIZE);
const double rx = 1;
const double ry = 1;
double *kx = NULL;
hipMalloc(&kx, XSIZE*YSIZE);
double *ky = NULL;
hipMalloc(&ky, XSIZE*YSIZE);
double *u0 = NULL;
hipMalloc(&u0, XSIZE*YSIZE);
double *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
const int coefficient = 1;
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
jacobi_init<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,density,energy,rx,ry,kx,ky,u0,u,coefficient);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
jacobi_init<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,density,energy,rx,ry,kx,ky,u0,u,coefficient);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
jacobi_init<<<gridBlock, threadBlock>>>(x_inner,y_inner,halo_depth,density,energy,rx,ry,kx,ky,u0,u,coefficient);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}