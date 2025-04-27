#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "mc_kernel_put_llm.cu"
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
    float *d_s = NULL;
hipMalloc(&d_s, XSIZE*YSIZE);
float T = 1;
float K = 1;
float S0 = 1;
float sigma = 1;
float mu = 1;
float r = 1;
float dt = 1;
float *d_normals = NULL;
hipMalloc(&d_normals, XSIZE*YSIZE);
unsigned N_STEPS = 1;
unsigned N_PATHS = 1;
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
mc_kernel_put<<<gridBlock, threadBlock>>>(d_s,T,K,S0,sigma,mu,r,dt,d_normals,N_STEPS,N_PATHS);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
mc_kernel_put<<<gridBlock, threadBlock>>>(d_s,T,K,S0,sigma,mu,r,dt,d_normals,N_STEPS,N_PATHS);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
mc_kernel_put<<<gridBlock, threadBlock>>>(d_s,T,K,S0,sigma,mu,r,dt,d_normals,N_STEPS,N_PATHS);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}