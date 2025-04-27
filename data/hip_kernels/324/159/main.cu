#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kBoundingBoxLogisticGrad.cu"
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
    float *mat = NULL;
hipMalloc(&mat, XSIZE*YSIZE);
int *bbox = NULL;
hipMalloc(&bbox, XSIZE*YSIZE);
int *label = NULL;
hipMalloc(&label, XSIZE*YSIZE);
int *seg = NULL;
hipMalloc(&seg, XSIZE*YSIZE);
float *indices = NULL;
hipMalloc(&indices, XSIZE*YSIZE);
float *width_offset = NULL;
hipMalloc(&width_offset, XSIZE*YSIZE);
float *height_offset = NULL;
hipMalloc(&height_offset, XSIZE*YSIZE);
int size = XSIZE*YSIZE;
int width = XSIZE;
int height = YSIZE;
int depth = 1;
float scale_width = XSIZE;
float scale_height = YSIZE;
float *grad = NULL;
hipMalloc(&grad, XSIZE*YSIZE);
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
kBoundingBoxLogisticGrad<<<gridBlock, threadBlock>>>(mat,bbox,label,seg,indices,width_offset,height_offset,size,width,height,depth,scale_width,scale_height,grad);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kBoundingBoxLogisticGrad<<<gridBlock, threadBlock>>>(mat,bbox,label,seg,indices,width_offset,height_offset,size,width,height,depth,scale_width,scale_height,grad);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kBoundingBoxLogisticGrad<<<gridBlock, threadBlock>>>(mat,bbox,label,seg,indices,width_offset,height_offset,size,width,height,depth,scale_width,scale_height,grad);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}