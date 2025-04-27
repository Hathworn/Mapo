#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculate_correlation.cu"
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
    float *norm = NULL;
hipMalloc(&norm, XSIZE*YSIZE);
float *corelation = NULL;
hipMalloc(&corelation, XSIZE*YSIZE);
float *miu_x = NULL;
hipMalloc(&miu_x, XSIZE*YSIZE);
float *miu_y = NULL;
hipMalloc(&miu_y, XSIZE*YSIZE);
float *stdx = NULL;
hipMalloc(&stdx, XSIZE*YSIZE);
float *stdy = NULL;
hipMalloc(&stdy, XSIZE*YSIZE);
int *ikj = NULL;
hipMalloc(&ikj, XSIZE*YSIZE);
float *dif_variance = NULL;
hipMalloc(&dif_variance, XSIZE*YSIZE);
int max = 1;
float sum = 1;
int size = XSIZE*YSIZE;
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
calculate_correlation<<<gridBlock, threadBlock>>>(norm,corelation,miu_x,miu_y,stdx,stdy,ikj,dif_variance,max,sum,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculate_correlation<<<gridBlock, threadBlock>>>(norm,corelation,miu_x,miu_y,stdx,stdy,ikj,dif_variance,max,sum,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculate_correlation<<<gridBlock, threadBlock>>>(norm,corelation,miu_x,miu_y,stdx,stdy,ikj,dif_variance,max,sum,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}