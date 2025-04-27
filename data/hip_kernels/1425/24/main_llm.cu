#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_getRandomCTD_llm.cu"
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
    double *dev_nt = NULL;
hipMalloc(&dev_nt, XSIZE*YSIZE);
double *dev_tran = NULL;
hipMalloc(&dev_tran, XSIZE*YSIZE);
double *dev_nd = NULL;
hipMalloc(&dev_nd, XSIZE*YSIZE);
double *dev_ramD = NULL;
hipMalloc(&dev_ramD, XSIZE*YSIZE);
double *dev_nr = NULL;
hipMalloc(&dev_nr, XSIZE*YSIZE);
double *dev_ramR = NULL;
hipMalloc(&dev_ramR, XSIZE*YSIZE);
unsigned int out = 1;
int rSize = XSIZE*YSIZE;
int tSize = XSIZE*YSIZE;
int dSize = XSIZE*YSIZE;
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
kernel_getRandomCTD<<<gridBlock, threadBlock>>>(dev_nt,dev_tran,dev_nd,dev_ramD,dev_nr,dev_ramR,out,rSize,tSize,dSize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_getRandomCTD<<<gridBlock, threadBlock>>>(dev_nt,dev_tran,dev_nd,dev_ramD,dev_nr,dev_ramR,out,rSize,tSize,dSize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_getRandomCTD<<<gridBlock, threadBlock>>>(dev_nt,dev_tran,dev_nd,dev_ramD,dev_nr,dev_ramR,out,rSize,tSize,dSize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}