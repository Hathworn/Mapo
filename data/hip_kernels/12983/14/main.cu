#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "Overlay_Cuda.cu"
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
    int x_position = 1;
int y_position = 1;
unsigned char *main = NULL;
hipMalloc(&main, XSIZE*YSIZE);
int main_linesize = XSIZE*YSIZE;
unsigned char *overlay = NULL;
hipMalloc(&overlay, XSIZE*YSIZE);
int overlay_linesize = XSIZE*YSIZE;
int overlay_w = 1;
int overlay_h = 1;
unsigned char *overlay_alpha = NULL;
hipMalloc(&overlay_alpha, XSIZE*YSIZE);
int alpha_linesize = XSIZE*YSIZE;
int alpha_adj_x = 2;
int alpha_adj_y = 2;
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
Overlay_Cuda<<<gridBlock, threadBlock>>>(x_position,y_position,main,main_linesize,overlay,overlay_linesize,overlay_w,overlay_h,overlay_alpha,alpha_linesize,alpha_adj_x,alpha_adj_y);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
Overlay_Cuda<<<gridBlock, threadBlock>>>(x_position,y_position,main,main_linesize,overlay,overlay_linesize,overlay_w,overlay_h,overlay_alpha,alpha_linesize,alpha_adj_x,alpha_adj_y);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
Overlay_Cuda<<<gridBlock, threadBlock>>>(x_position,y_position,main,main_linesize,overlay,overlay_linesize,overlay_w,overlay_h,overlay_alpha,alpha_linesize,alpha_adj_x,alpha_adj_y);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}