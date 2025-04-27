#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "deInterleave_kernel2.cu"
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
    float *d_X_out = NULL;
hipMalloc(&d_X_out, XSIZE*YSIZE);
float *d_Y_out = NULL;
hipMalloc(&d_Y_out, XSIZE*YSIZE);
char *d_XY_in = NULL;
hipMalloc(&d_XY_in, XSIZE*YSIZE);
int pitch_out = 2;
int pitch_in = 2;
int width = XSIZE;
int height = YSIZE;
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
deInterleave_kernel2<<<gridBlock, threadBlock>>>(d_X_out,d_Y_out,d_XY_in,pitch_out,pitch_in,width,height);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
deInterleave_kernel2<<<gridBlock, threadBlock>>>(d_X_out,d_Y_out,d_XY_in,pitch_out,pitch_in,width,height);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
deInterleave_kernel2<<<gridBlock, threadBlock>>>(d_X_out,d_Y_out,d_XY_in,pitch_out,pitch_in,width,height);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}