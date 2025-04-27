#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "g_updatePrimalVar_llm.cu"
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
float *u_bar = NULL;
hipMalloc(&u_bar, XSIZE*YSIZE);
float *u_diff = NULL;
hipMalloc(&u_diff, XSIZE*YSIZE);
const float *p = NULL;
hipMalloc(&p, XSIZE*YSIZE);
const float *f = NULL;
hipMalloc(&f, XSIZE*YSIZE);
const float *scalar_op = NULL;
hipMalloc(&scalar_op, XSIZE*YSIZE);
float tau = 1;
float theta = 1;
size_t width = XSIZE;
size_t height = YSIZE;
size_t channels = 1;
const bool *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
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
g_updatePrimalVar<<<gridBlock, threadBlock>>>(u,u_bar,u_diff,p,f,scalar_op,tau,theta,width,height,channels,mask);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
g_updatePrimalVar<<<gridBlock, threadBlock>>>(u,u_bar,u_diff,p,f,scalar_op,tau,theta,width,height,channels,mask);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
g_updatePrimalVar<<<gridBlock, threadBlock>>>(u,u_bar,u_diff,p,f,scalar_op,tau,theta,width,height,channels,mask);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}