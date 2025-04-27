#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Corrector_gpu.cu"
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
    double GTIME = 1;
double *local_time = NULL;
hipMalloc(&local_time, XSIZE*YSIZE);
double *step = NULL;
hipMalloc(&step, XSIZE*YSIZE);
int *next = NULL;
hipMalloc(&next, XSIZE*YSIZE);
unsigned long nextsize = 1;
double4 *pos_CH = NULL;
hipMalloc(&pos_CH, XSIZE*YSIZE);
double4 *vel_CH = NULL;
hipMalloc(&vel_CH, XSIZE*YSIZE);
double4 *a_tot_D = NULL;
hipMalloc(&a_tot_D, XSIZE*YSIZE);
double4 *a1_tot_D = NULL;
hipMalloc(&a1_tot_D, XSIZE*YSIZE);
double4 *a2_tot_D = NULL;
hipMalloc(&a2_tot_D, XSIZE*YSIZE);
double4 *a_H0 = NULL;
hipMalloc(&a_H0, XSIZE*YSIZE);
double4 *a3_H = NULL;
hipMalloc(&a3_H, XSIZE*YSIZE);
double ETA6 = 1;
double ETA4 = 1;
double DTMAX = 1;
double DTMIN = 1;
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
Corrector_gpu<<<gridBlock, threadBlock>>>(GTIME,local_time,step,next,nextsize,pos_CH,vel_CH,a_tot_D,a1_tot_D,a2_tot_D,a_H0,a3_H,ETA6,ETA4,DTMAX,DTMIN,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Corrector_gpu<<<gridBlock, threadBlock>>>(GTIME,local_time,step,next,nextsize,pos_CH,vel_CH,a_tot_D,a1_tot_D,a2_tot_D,a_H0,a3_H,ETA6,ETA4,DTMAX,DTMIN,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Corrector_gpu<<<gridBlock, threadBlock>>>(GTIME,local_time,step,next,nextsize,pos_CH,vel_CH,a_tot_D,a1_tot_D,a2_tot_D,a_H0,a3_H,ETA6,ETA4,DTMAX,DTMIN,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}