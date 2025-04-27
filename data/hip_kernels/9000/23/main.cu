#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Predictor.cu"
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
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
Predictor<<<gridBlock, threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Predictor<<<gridBlock, threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Predictor<<<gridBlock, threadBlock>>>(TIME,p_pred,v_pred,a_pred,p_corr,v_corr,loc_time,acc,acc1,acc2,acc3,istart,nvec,ppgpus,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}