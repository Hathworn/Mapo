#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "dual.cu"
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
    float *xn = NULL;
hipMalloc(&xn, XSIZE*YSIZE);
float *xcur = NULL;
hipMalloc(&xcur, XSIZE*YSIZE);
float *y1 = NULL;
hipMalloc(&y1, XSIZE*YSIZE);
float *y2 = NULL;
hipMalloc(&y2, XSIZE*YSIZE);
float *img = NULL;
hipMalloc(&img, XSIZE*YSIZE);
float tau = 1;
float lambda = 1;
int w = XSIZE;
int h = YSIZE;
int nc = 1;
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
dual<<<gridBlock, threadBlock>>>(xn,xcur,y1,y2,img,tau,lambda,w,h,nc);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
dual<<<gridBlock, threadBlock>>>(xn,xcur,y1,y2,img,tau,lambda,w,h,nc);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
dual<<<gridBlock, threadBlock>>>(xn,xcur,y1,y2,img,tau,lambda,w,h,nc);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}