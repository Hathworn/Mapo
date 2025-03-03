#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "Predictor.cu"
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
const double TIME = 1;
double4 *p_pred = NULL;
hipMalloc(&p_pred, XSIZE*YSIZE);
float4 *v_pred = NULL;
hipMalloc(&v_pred, XSIZE*YSIZE);
float4 *a_pred = NULL;
hipMalloc(&a_pred, XSIZE*YSIZE);
double4 *p_corr = NULL;
hipMalloc(&p_corr, XSIZE*YSIZE);
double4 *v_corr = NULL;
hipMalloc(&v_corr, XSIZE*YSIZE);
double *loc_time = NULL;
hipMalloc(&loc_time, XSIZE*YSIZE);
double4 *acc = NULL;
hipMalloc(&acc, XSIZE*YSIZE);
double4 *acc1 = NULL;
hipMalloc(&acc1, XSIZE*YSIZE);
double4 *acc2 = NULL;
hipMalloc(&acc2, XSIZE*YSIZE);
double4 *acc3 = NULL;
hipMalloc(&acc3, XSIZE*YSIZE);
int istart = 1;
int *nvec = NULL;
hipMalloc(&nvec, XSIZE*YSIZE);
int ppgpus = 1;
unsigned int N = 1;
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
Predictor<<<gridBlock,threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
Predictor<<<gridBlock,threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
Predictor<<<gridBlock,threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}