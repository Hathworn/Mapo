#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "rgb2yuv_gpu_son.cu"
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
    unsigned char *d_r = NULL;
hipMalloc(&d_r, XSIZE*YSIZE);
unsigned char *d_g = NULL;
hipMalloc(&d_g, XSIZE*YSIZE);
unsigned char *d_b = NULL;
hipMalloc(&d_b, XSIZE*YSIZE);
unsigned char *d_y = NULL;
hipMalloc(&d_y, XSIZE*YSIZE);
unsigned char *d_u = NULL;
hipMalloc(&d_u, XSIZE*YSIZE);
unsigned char *d_v = NULL;
hipMalloc(&d_v, XSIZE*YSIZE);
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
rgb2yuv_gpu_son<<<gridBlock, threadBlock>>>(d_r,d_g,d_b,d_y,d_u,d_v,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
rgb2yuv_gpu_son<<<gridBlock, threadBlock>>>(d_r,d_g,d_b,d_y,d_u,d_v,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
rgb2yuv_gpu_son<<<gridBlock, threadBlock>>>(d_r,d_g,d_b,d_y,d_u,d_v,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}