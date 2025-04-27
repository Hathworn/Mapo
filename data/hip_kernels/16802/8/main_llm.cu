#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_init_equilibrium_llm.cu"
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
    double *f0 = NULL;
hipMalloc(&f0, XSIZE*YSIZE);
double *f1 = NULL;
hipMalloc(&f1, XSIZE*YSIZE);
double *h0 = NULL;
hipMalloc(&h0, XSIZE*YSIZE);
double *h1 = NULL;
hipMalloc(&h1, XSIZE*YSIZE);
double *temp0 = NULL;
hipMalloc(&temp0, XSIZE*YSIZE);
double *temp1 = NULL;
hipMalloc(&temp1, XSIZE*YSIZE);
double *r = NULL;
hipMalloc(&r, XSIZE*YSIZE);
double *c = NULL;
hipMalloc(&c, XSIZE*YSIZE);
double *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
double *v = NULL;
hipMalloc(&v, XSIZE*YSIZE);
double *w = NULL;
hipMalloc(&w, XSIZE*YSIZE);
double *ex = NULL;
hipMalloc(&ex, XSIZE*YSIZE);
double *ey = NULL;
hipMalloc(&ey, XSIZE*YSIZE);
double *ez = NULL;
hipMalloc(&ez, XSIZE*YSIZE);
double *temp = NULL;
hipMalloc(&temp, XSIZE*YSIZE);
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
gpu_init_equilibrium<<<gridBlock, threadBlock>>>(f0,f1,h0,h1,temp0,temp1,r,c,u,v,w,ex,ey,ez,temp);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_init_equilibrium<<<gridBlock, threadBlock>>>(f0,f1,h0,h1,temp0,temp1,r,c,u,v,w,ex,ey,ez,temp);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_init_equilibrium<<<gridBlock, threadBlock>>>(f0,f1,h0,h1,temp0,temp1,r,c,u,v,w,ex,ey,ez,temp);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}