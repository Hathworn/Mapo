#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_extract_roi_llm.cu"
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
    float *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
float *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
char *mean = NULL;
hipMalloc(&mean, XSIZE*YSIZE);
const int input_w = 1;
const int output_w = 1;
const int output_h = 1;
const int in_plane_r = 1;
const int in_plane_g = 1;
const int in_plane_b = 1;
const int out_plane_r = 1;
const int out_plane_g = 1;
const int out_plane_b = 1;
const int bbox_x = 1;
const int bbox_y = 1;
const int bbox_w = 1;
const int bbox_h = 1;
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
kernel_extract_roi<<<gridBlock, threadBlock>>>(input,output,mean,input_w,output_w,output_h,in_plane_r,in_plane_g,in_plane_b,out_plane_r,out_plane_g,out_plane_b,bbox_x,bbox_y,bbox_w,bbox_h);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_extract_roi<<<gridBlock, threadBlock>>>(input,output,mean,input_w,output_w,output_h,in_plane_r,in_plane_g,in_plane_b,out_plane_r,out_plane_g,out_plane_b,bbox_x,bbox_y,bbox_w,bbox_h);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_extract_roi<<<gridBlock, threadBlock>>>(input,output,mean,input_w,output_w,output_h,in_plane_r,in_plane_g,in_plane_b,out_plane_r,out_plane_g,out_plane_b,bbox_x,bbox_y,bbox_w,bbox_h);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}