#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateLagrangeMultiplierKernel8ADMM.cu"
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
    float *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
float *v = NULL;
hipMalloc(&v, XSIZE*YSIZE);
float *w_ = NULL;
hipMalloc(&w_, XSIZE*YSIZE);
float *z = NULL;
hipMalloc(&z, XSIZE*YSIZE);
float *lam1 = NULL;
hipMalloc(&lam1, XSIZE*YSIZE);
float *lam2 = NULL;
hipMalloc(&lam2, XSIZE*YSIZE);
float *lam3 = NULL;
hipMalloc(&lam3, XSIZE*YSIZE);
float *lam4 = NULL;
hipMalloc(&lam4, XSIZE*YSIZE);
float *lam5 = NULL;
hipMalloc(&lam5, XSIZE*YSIZE);
float *lam6 = NULL;
hipMalloc(&lam6, XSIZE*YSIZE);
float *temp = NULL;
hipMalloc(&temp, XSIZE*YSIZE);
float mu = 1;
uint32_t w = XSIZE;
uint32_t h = YSIZE;
uint32_t nc = 1;
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
updateLagrangeMultiplierKernel8ADMM<<<gridBlock, threadBlock>>>(u,v,w_,z,lam1,lam2,lam3,lam4,lam5,lam6,temp,mu,w,h,nc);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateLagrangeMultiplierKernel8ADMM<<<gridBlock, threadBlock>>>(u,v,w_,z,lam1,lam2,lam3,lam4,lam5,lam6,temp,mu,w,h,nc);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateLagrangeMultiplierKernel8ADMM<<<gridBlock, threadBlock>>>(u,v,w_,z,lam1,lam2,lam3,lam4,lam5,lam6,temp,mu,w,h,nc);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}