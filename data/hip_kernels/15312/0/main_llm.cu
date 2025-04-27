#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateEigenValue_llm.cu"
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
    int *d_rowPtr = NULL;
hipMalloc(&d_rowPtr, XSIZE*YSIZE);
int *d_col = NULL;
hipMalloc(&d_col, XSIZE*YSIZE);
float *d_val = NULL;
hipMalloc(&d_val, XSIZE*YSIZE);
float *d_b = NULL;
hipMalloc(&d_b, XSIZE*YSIZE);
float *d_temp = NULL;
hipMalloc(&d_temp, XSIZE*YSIZE);
float *d_normAb = NULL;
hipMalloc(&d_normAb, XSIZE*YSIZE);
float *d_alpha1 = NULL;
hipMalloc(&d_alpha1, XSIZE*YSIZE);
float *d_alpha2 = NULL;
hipMalloc(&d_alpha2, XSIZE*YSIZE);
int n = XSIZE*YSIZE;
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
updateEigenValue<<<gridBlock, threadBlock>>>(d_rowPtr,d_col,d_val,d_b,d_temp,d_normAb,d_alpha1,d_alpha2,n);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateEigenValue<<<gridBlock, threadBlock>>>(d_rowPtr,d_col,d_val,d_b,d_temp,d_normAb,d_alpha1,d_alpha2,n);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateEigenValue<<<gridBlock, threadBlock>>>(d_rowPtr,d_col,d_val,d_b,d_temp,d_normAb,d_alpha1,d_alpha2,n);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}