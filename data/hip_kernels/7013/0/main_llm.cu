#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ray_shoot_llm.cu"
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
    int *maxX = NULL;
hipMalloc(&maxX, XSIZE*YSIZE);
int *maxY = NULL;
hipMalloc(&maxY, XSIZE*YSIZE);
float *lens_scale = NULL;
hipMalloc(&lens_scale, XSIZE*YSIZE);
float *xlens = NULL;
hipMalloc(&xlens, XSIZE*YSIZE);
float *ylens = NULL;
hipMalloc(&ylens, XSIZE*YSIZE);
float *eps = NULL;
hipMalloc(&eps, XSIZE*YSIZE);
int *num_lenses = NULL;
hipMalloc(&num_lenses, XSIZE*YSIZE);
float *dev_arr = NULL;
hipMalloc(&dev_arr, XSIZE*YSIZE);
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
ray_shoot<<<gridBlock, threadBlock>>>(maxX,maxY,lens_scale,xlens,ylens,eps,num_lenses,dev_arr);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ray_shoot<<<gridBlock, threadBlock>>>(maxX,maxY,lens_scale,xlens,ylens,eps,num_lenses,dev_arr);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ray_shoot<<<gridBlock, threadBlock>>>(maxX,maxY,lens_scale,xlens,ylens,eps,num_lenses,dev_arr);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}