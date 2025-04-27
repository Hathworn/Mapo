#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "resampleFeaturesKernel.cu"
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
    double *u = NULL;
hipMalloc(&u, XSIZE*YSIZE);
double *v = NULL;
hipMalloc(&v, XSIZE*YSIZE);
double *d = NULL;
hipMalloc(&d, XSIZE*YSIZE);
double *vu = NULL;
hipMalloc(&vu, XSIZE*YSIZE);
double *vv = NULL;
hipMalloc(&vv, XSIZE*YSIZE);
double *vd = NULL;
hipMalloc(&vd, XSIZE*YSIZE);
double *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
double *randvals = NULL;
hipMalloc(&randvals, XSIZE*YSIZE);
int n_features = 1;
double *u_sampled = NULL;
hipMalloc(&u_sampled, XSIZE*YSIZE);
double *v_sampled = NULL;
hipMalloc(&v_sampled, XSIZE*YSIZE);
double *d_sampled = NULL;
hipMalloc(&d_sampled, XSIZE*YSIZE);
double *vu_sampled = NULL;
hipMalloc(&vu_sampled, XSIZE*YSIZE);
double *vv_sampled = NULL;
hipMalloc(&vv_sampled, XSIZE*YSIZE);
double *vd_sampled = NULL;
hipMalloc(&vd_sampled, XSIZE*YSIZE);
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
resampleFeaturesKernel<<<gridBlock, threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
resampleFeaturesKernel<<<gridBlock, threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
resampleFeaturesKernel<<<gridBlock, threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}