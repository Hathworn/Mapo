#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convertFlowToRGBA_kernel_llm.cu"
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
    uchar4 *d_flowx_out = NULL;
hipMalloc(&d_flowx_out, XSIZE*YSIZE);
uchar4 *d_flowy_out = NULL;
hipMalloc(&d_flowy_out, XSIZE*YSIZE);
const float *d_flowx_in = NULL;
hipMalloc(&d_flowx_in, XSIZE*YSIZE);
const float *d_flowy_in = NULL;
hipMalloc(&d_flowy_in, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
float lowerLim = 1;
float upperLim = 1;
float minMag = 1;
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
convertFlowToRGBA_kernel<<<gridBlock, threadBlock>>>(d_flowx_out,d_flowy_out,d_flowx_in,d_flowy_in,width,height,lowerLim,upperLim,minMag);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convertFlowToRGBA_kernel<<<gridBlock, threadBlock>>>(d_flowx_out,d_flowy_out,d_flowx_in,d_flowy_in,width,height,lowerLim,upperLim,minMag);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convertFlowToRGBA_kernel<<<gridBlock, threadBlock>>>(d_flowx_out,d_flowy_out,d_flowx_in,d_flowy_in,width,height,lowerLim,upperLim,minMag);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}