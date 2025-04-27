#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "tonemap.cu"
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
    float *d_x = NULL;
hipMalloc(&d_x, XSIZE*YSIZE);
float *d_y = NULL;
hipMalloc(&d_y, XSIZE*YSIZE);
float *d_log_Y = NULL;
hipMalloc(&d_log_Y, XSIZE*YSIZE);
float *d_cdf_norm = NULL;
hipMalloc(&d_cdf_norm, XSIZE*YSIZE);
float *d_r_new = NULL;
hipMalloc(&d_r_new, XSIZE*YSIZE);
float *d_g_new = NULL;
hipMalloc(&d_g_new, XSIZE*YSIZE);
float *d_b_new = NULL;
hipMalloc(&d_b_new, XSIZE*YSIZE);
float min_log_Y = 1;
float max_log_Y = 1;
float log_Y_range = 1;
int num_bins = 1;
int num_pixels_y = 1;
int num_pixels_x = 1;
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
tonemap<<<gridBlock, threadBlock>>>(d_x,d_y,d_log_Y,d_cdf_norm,d_r_new,d_g_new,d_b_new,min_log_Y,max_log_Y,log_Y_range,num_bins,num_pixels_y,num_pixels_x);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
tonemap<<<gridBlock, threadBlock>>>(d_x,d_y,d_log_Y,d_cdf_norm,d_r_new,d_g_new,d_b_new,min_log_Y,max_log_Y,log_Y_range,num_bins,num_pixels_y,num_pixels_x);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
tonemap<<<gridBlock, threadBlock>>>(d_x,d_y,d_log_Y,d_cdf_norm,d_r_new,d_g_new,d_b_new,min_log_Y,max_log_Y,log_Y_range,num_bins,num_pixels_y,num_pixels_x);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}