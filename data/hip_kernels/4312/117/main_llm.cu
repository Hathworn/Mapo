#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "clipFilterDepthKernel_llm.cu"
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
    cudaTextureObject_t raw_depth = 1;
const unsigned clip_img_rows = 1;
const unsigned clip_img_cols = 1;
const unsigned clip_near = 1;
const unsigned clip_far = 1;
const float sigma_s_inv_square = 1;
const float sigma_r_inv_square = 1;
cudaSurfaceObject_t filter_depth = 2;
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
clipFilterDepthKernel<<<gridBlock, threadBlock>>>(raw_depth,clip_img_rows,clip_img_cols,clip_near,clip_far,sigma_s_inv_square,sigma_r_inv_square,filter_depth);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
clipFilterDepthKernel<<<gridBlock, threadBlock>>>(raw_depth,clip_img_rows,clip_img_cols,clip_near,clip_far,sigma_s_inv_square,sigma_r_inv_square,filter_depth);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
clipFilterDepthKernel<<<gridBlock, threadBlock>>>(raw_depth,clip_img_rows,clip_img_cols,clip_near,clip_far,sigma_s_inv_square,sigma_r_inv_square,filter_depth);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}