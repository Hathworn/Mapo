#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "TgvUpdateDualVariablesTGVKernel.cu"
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
    float *u_ = NULL;
hipMalloc(&u_, XSIZE*YSIZE);
float2 *v_ = NULL;
hipMalloc(&v_, XSIZE*YSIZE);
float alpha0 = 2;
float alpha1 = 2;
float sigma = 1;
float eta_p = 1;
float eta_q = 1;
float *a = NULL;
hipMalloc(&a, XSIZE*YSIZE);
float *b = NULL;
hipMalloc(&b, XSIZE*YSIZE);
float *c = NULL;
hipMalloc(&c, XSIZE*YSIZE);
float4 *grad_v = NULL;
hipMalloc(&grad_v, XSIZE*YSIZE);
float2 *p = NULL;
hipMalloc(&p, XSIZE*YSIZE);
float4 *q = NULL;
hipMalloc(&q, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
int stride = 2;
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
TgvUpdateDualVariablesTGVKernel<<<gridBlock, threadBlock>>>(u_,v_,alpha0,alpha1,sigma,eta_p,eta_q,a,b,c,grad_v,p,q,width,height,stride);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
TgvUpdateDualVariablesTGVKernel<<<gridBlock, threadBlock>>>(u_,v_,alpha0,alpha1,sigma,eta_p,eta_q,a,b,c,grad_v,p,q,width,height,stride);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
TgvUpdateDualVariablesTGVKernel<<<gridBlock, threadBlock>>>(u_,v_,alpha0,alpha1,sigma,eta_p,eta_q,a,b,c,grad_v,p,q,width,height,stride);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}