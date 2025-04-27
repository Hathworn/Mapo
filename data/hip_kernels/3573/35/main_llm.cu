#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "IMOMask_kernel_llm.cu"
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
    float *d_IMOMask = NULL;
hipMalloc(&d_IMOMask, XSIZE*YSIZE);
float *d_IMO = NULL;
hipMalloc(&d_IMO, XSIZE*YSIZE);
const float *d_disparity = NULL;
hipMalloc(&d_disparity, XSIZE*YSIZE);
float offset = 2;
int n_cols = 1;
int n_rows = 1;
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
IMOMask_kernel<<<gridBlock, threadBlock>>>(d_IMOMask,d_IMO,d_disparity,offset,n_cols,n_rows);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
IMOMask_kernel<<<gridBlock, threadBlock>>>(d_IMOMask,d_IMO,d_disparity,offset,n_cols,n_rows);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
IMOMask_kernel<<<gridBlock, threadBlock>>>(d_IMOMask,d_IMO,d_disparity,offset,n_cols,n_rows);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}