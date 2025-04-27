#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuda_copyRegion.cu"
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
    unsigned char *dst = NULL;
hipMalloc(&dst, XSIZE*YSIZE);
unsigned char *src = NULL;
hipMalloc(&src, XSIZE*YSIZE);
int stepDst = 1;
int stepSrc = 1;
int dst_width = XSIZE;
int dst_height = YSIZE;
int src_width = XSIZE;
int src_height = YSIZE;
int dst_xoffset = 1;
int dst_yoffset = 1;
int dst_widthToCrop = XSIZE;
int dst_heightToCrop = YSIZE;
int src_xoffset = 1;
int src_yoffset = 1;
int src_widthToCrop = XSIZE;
int src_heightToCrop = YSIZE;
int numChannel = 1;
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
cuda_copyRegion<<<gridBlock, threadBlock>>>(dst,src,stepDst,stepSrc,dst_width,dst_height,src_width,src_height,dst_xoffset,dst_yoffset,dst_widthToCrop,dst_heightToCrop,src_xoffset,src_yoffset,src_widthToCrop,src_heightToCrop,numChannel);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuda_copyRegion<<<gridBlock, threadBlock>>>(dst,src,stepDst,stepSrc,dst_width,dst_height,src_width,src_height,dst_xoffset,dst_yoffset,dst_widthToCrop,dst_heightToCrop,src_xoffset,src_yoffset,src_widthToCrop,src_heightToCrop,numChannel);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuda_copyRegion<<<gridBlock, threadBlock>>>(dst,src,stepDst,stepSrc,dst_width,dst_height,src_width,src_height,dst_xoffset,dst_yoffset,dst_widthToCrop,dst_heightToCrop,src_xoffset,src_yoffset,src_widthToCrop,src_heightToCrop,numChannel);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}