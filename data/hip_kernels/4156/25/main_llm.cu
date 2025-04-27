#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "render_final_llm.cu"
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
    float *points3d_polar = NULL;
hipMalloc(&points3d_polar, XSIZE*YSIZE);
float *selection = NULL;
hipMalloc(&selection, XSIZE*YSIZE);
float *depth_render = NULL;
hipMalloc(&depth_render, XSIZE*YSIZE);
int *img = NULL;
hipMalloc(&img, XSIZE*YSIZE);
int *render = NULL;
hipMalloc(&render, XSIZE*YSIZE);
int oh = 1;
int ow = 1;
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
render_final<<<gridBlock, threadBlock>>>(points3d_polar,selection,depth_render,img,render,oh,ow);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
render_final<<<gridBlock, threadBlock>>>(points3d_polar,selection,depth_render,img,render,oh,ow);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
render_final<<<gridBlock, threadBlock>>>(points3d_polar,selection,depth_render,img,render,oh,ow);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}