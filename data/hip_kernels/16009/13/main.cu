#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ComputeRobustnessMask.cu"
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
    const float3 __restrict__ *rawImgRef = NULL;
hipMalloc(&rawImgRef, XSIZE*YSIZE);
const float3 __restrict__ *rawImgMoved = NULL;
hipMalloc(&rawImgMoved, XSIZE*YSIZE);
float4 __restrict__ *robustnessMask = NULL;
hipMalloc(&robustnessMask, XSIZE*YSIZE);
cudaTextureObject_t texUV = 1;
int imgWidth = XSIZE;
int imgHeight = YSIZE;
int imgPitch = 2;
int maskPitch = 2;
float alpha = 2;
float beta = 2;
float thresholdM = 1;
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
ComputeRobustnessMask<<<gridBlock, threadBlock>>>(rawImgRef,rawImgMoved,robustnessMask,texUV,imgWidth,imgHeight,imgPitch,maskPitch,alpha,beta,thresholdM);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ComputeRobustnessMask<<<gridBlock, threadBlock>>>(rawImgRef,rawImgMoved,robustnessMask,texUV,imgWidth,imgHeight,imgPitch,maskPitch,alpha,beta,thresholdM);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ComputeRobustnessMask<<<gridBlock, threadBlock>>>(rawImgRef,rawImgMoved,robustnessMask,texUV,imgWidth,imgHeight,imgPitch,maskPitch,alpha,beta,thresholdM);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}