#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "box_encode_kernel.cu"
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
    float *targets_dx = NULL;
hipMalloc(&targets_dx, XSIZE*YSIZE);
float *targets_dy = NULL;
hipMalloc(&targets_dy, XSIZE*YSIZE);
float *targets_dw = NULL;
hipMalloc(&targets_dw, XSIZE*YSIZE);
float *targets_dh = NULL;
hipMalloc(&targets_dh, XSIZE*YSIZE);
float4 *boxes = NULL;
hipMalloc(&boxes, XSIZE*YSIZE);
float4 *anchors = NULL;
hipMalloc(&anchors, XSIZE*YSIZE);
float wx = 1;
float wy = 1;
float ww = 1;
float wh = 1;
size_t gt = 1;
size_t idxJump = 1;
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
box_encode_kernel<<<gridBlock, threadBlock>>>(targets_dx,targets_dy,targets_dw,targets_dh,boxes,anchors,wx,wy,ww,wh,gt,idxJump);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
box_encode_kernel<<<gridBlock, threadBlock>>>(targets_dx,targets_dy,targets_dw,targets_dh,boxes,anchors,wx,wy,ww,wh,gt,idxJump);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
box_encode_kernel<<<gridBlock, threadBlock>>>(targets_dx,targets_dy,targets_dw,targets_dh,boxes,anchors,wx,wy,ww,wh,gt,idxJump);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}