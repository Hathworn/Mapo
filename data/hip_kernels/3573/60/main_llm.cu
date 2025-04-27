#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "colorDistDiff_kernel_llm.cu"
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
    uchar4 *out_image = NULL;
hipMalloc(&out_image, XSIZE*YSIZE);
const float *disparity = NULL;
hipMalloc(&disparity, XSIZE*YSIZE);
int disparity_pitch = 2;
const float *disparity_prior = NULL;
hipMalloc(&disparity_prior, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
float f = 1;
float b = 2;
float ox = 1;
float oy = 1;
float dist_thres = 1;
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
colorDistDiff_kernel<<<gridBlock, threadBlock>>>(out_image,disparity,disparity_pitch,disparity_prior,width,height,f,b,ox,oy,dist_thres);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
colorDistDiff_kernel<<<gridBlock, threadBlock>>>(out_image,disparity,disparity_pitch,disparity_prior,width,height,f,b,ox,oy,dist_thres);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
colorDistDiff_kernel<<<gridBlock, threadBlock>>>(out_image,disparity,disparity_pitch,disparity_prior,width,height,f,b,ox,oy,dist_thres);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}