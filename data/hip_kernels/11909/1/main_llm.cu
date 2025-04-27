#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaTIGammaKernel_llm.cu"
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
    double *extEV = NULL;
hipMalloc(&extEV, XSIZE*YSIZE);
double *x2 = NULL;
hipMalloc(&x2, XSIZE*YSIZE);
double *x3 = NULL;
hipMalloc(&x3, XSIZE*YSIZE);
unsigned char *tipX1 = NULL;
hipMalloc(&tipX1, XSIZE*YSIZE);
unsigned char *tipX2 = NULL;
hipMalloc(&tipX2, XSIZE*YSIZE);
double *r = NULL;
hipMalloc(&r, XSIZE*YSIZE);
double *uX1 = NULL;
hipMalloc(&uX1, XSIZE*YSIZE);
double *uX2 = NULL;
hipMalloc(&uX2, XSIZE*YSIZE);
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
cudaTIGammaKernel<<<gridBlock, threadBlock>>>(extEV,x2,x3,tipX1,tipX2,r,uX1,uX2);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaTIGammaKernel<<<gridBlock, threadBlock>>>(extEV,x2,x3,tipX1,tipX2,r,uX1,uX2);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaTIGammaKernel<<<gridBlock, threadBlock>>>(extEV,x2,x3,tipX1,tipX2,r,uX1,uX2);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}