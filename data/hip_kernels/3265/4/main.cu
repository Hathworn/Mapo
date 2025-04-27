#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "simKernel.cu"
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
    int N_stgy = 1;
int N_batch = 2;
float *alpha = NULL;
hipMalloc(&alpha, XSIZE*YSIZE);
float *mid = NULL;
hipMalloc(&mid, XSIZE*YSIZE);
float *gap = NULL;
hipMalloc(&gap, XSIZE*YSIZE);
int *late = NULL;
hipMalloc(&late, XSIZE*YSIZE);
int *pos = NULL;
hipMalloc(&pos, XSIZE*YSIZE);
int *rest_lag = NULL;
hipMalloc(&rest_lag, XSIZE*YSIZE);
float *prof = NULL;
hipMalloc(&prof, XSIZE*YSIZE);
float *last_prc = NULL;
hipMalloc(&last_prc, XSIZE*YSIZE);
int *cnt = NULL;
hipMalloc(&cnt, XSIZE*YSIZE);
float fee = 1;
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
simKernel<<<gridBlock, threadBlock>>>(N_stgy,N_batch,alpha,mid,gap,late,pos,rest_lag,prof,last_prc,cnt,fee);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
simKernel<<<gridBlock, threadBlock>>>(N_stgy,N_batch,alpha,mid,gap,late,pos,rest_lag,prof,last_prc,cnt,fee);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
simKernel<<<gridBlock, threadBlock>>>(N_stgy,N_batch,alpha,mid,gap,late,pos,rest_lag,prof,last_prc,cnt,fee);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}