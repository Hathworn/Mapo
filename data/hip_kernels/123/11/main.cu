#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "resampleFeaturesKernel.cu"
#include<chrono>
#include<iostream>
using namespace std;
using namespace std::chrono;
int blocks_[20][2] = {{8,8},{16,16},{24,24},{32,32},{1,64},{1,128},{1,192},{1,256},{1,320},{1,384},{1,448},{1,512},{1,576},{1,640},{1,704},{1,768},{1,832},{1,896},{1,960},{1,1024}};
int matrices_[7][2] = {{240,240},{496,496},{784,784},{1016,1016},{1232,1232},{1680,1680},{2024,2024}};
int main(int argc, char **argv) {
hipSetDevice(0);
char* p;int matrix_len=strtol(argv[1], &p, 10);
for(int matrix_looper=0;matrix_looper<matrix_len;matrix_looper++){
for(int block_looper=0;block_looper<20;block_looper++){
int XSIZE=matrices_[matrix_looper][0],YSIZE=matrices_[matrix_looper][1],BLOCKX=blocks_[block_looper][0],BLOCKY=blocks_[block_looper][1];
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
while(iXSIZE%BLOCKX!=0)
{
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0)
{
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
resampleFeaturesKernel<<<gridBlock,threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
resampleFeaturesKernel<<<gridBlock,threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
resampleFeaturesKernel<<<gridBlock,threadBlock>>>(u,v,d,vu,vv,vd,weights,randvals,n_features,u_sampled,v_sampled,d_sampled,vu_sampled,vv_sampled,vd_sampled);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}