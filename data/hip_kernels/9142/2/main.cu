#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "rgb2hsl_kernel.cu"
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
    int img_size = XSIZE*YSIZE;
unsigned char *img_r = NULL;
hipMalloc(&img_r, XSIZE*YSIZE);
unsigned char *img_g = NULL;
hipMalloc(&img_g, XSIZE*YSIZE);
unsigned char *img_b = NULL;
hipMalloc(&img_b, XSIZE*YSIZE);
float *img_h = NULL;
hipMalloc(&img_h, XSIZE*YSIZE);
float *img_s = NULL;
hipMalloc(&img_s, XSIZE*YSIZE);
unsigned char *img_l = NULL;
hipMalloc(&img_l, XSIZE*YSIZE);
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
rgb2hsl_kernel<<<gridBlock, threadBlock>>>(img_size,img_r,img_g,img_b,img_h,img_s,img_l);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
rgb2hsl_kernel<<<gridBlock, threadBlock>>>(img_size,img_r,img_g,img_b,img_h,img_s,img_l);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
rgb2hsl_kernel<<<gridBlock, threadBlock>>>(img_size,img_r,img_g,img_b,img_h,img_s,img_l);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}