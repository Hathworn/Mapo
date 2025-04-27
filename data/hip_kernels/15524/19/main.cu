#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "idwt_per_X_1.cu"
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
    float *d_dst = NULL;
hipMalloc(&d_dst, XSIZE*YSIZE);
float *src_A = NULL;
hipMalloc(&src_A, XSIZE*YSIZE);
float *src_D = NULL;
hipMalloc(&src_D, XSIZE*YSIZE);
int rows = XSIZE;
int cols = YSIZE;
int next_cols = 1;
int filt_len = 1;
int halo = 1;
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
idwt_per_X_1<<<gridBlock, threadBlock>>>(d_dst,src_A,src_D,rows,cols,next_cols,filt_len,halo);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
idwt_per_X_1<<<gridBlock, threadBlock>>>(d_dst,src_A,src_D,rows,cols,next_cols,filt_len,halo);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
idwt_per_X_1<<<gridBlock, threadBlock>>>(d_dst,src_A,src_D,rows,cols,next_cols,filt_len,halo);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}