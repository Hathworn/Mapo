#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Subsample_Bilinear_uchar4.cu"
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
    cudaTextureObject_t uchar4_tex = 1;
uchar4 *dst = NULL;
hipMalloc(&dst, XSIZE*YSIZE);
int dst_width = XSIZE;
int dst_height = YSIZE;
int dst_pitch = 2;
int src_width = XSIZE;
int src_height = YSIZE;
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
Subsample_Bilinear_uchar4<<<gridBlock, threadBlock>>>(uchar4_tex,dst,dst_width,dst_height,dst_pitch,src_width,src_height);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Subsample_Bilinear_uchar4<<<gridBlock, threadBlock>>>(uchar4_tex,dst,dst_width,dst_height,dst_pitch,src_width,src_height);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Subsample_Bilinear_uchar4<<<gridBlock, threadBlock>>>(uchar4_tex,dst,dst_width,dst_height,dst_pitch,src_width,src_height);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}