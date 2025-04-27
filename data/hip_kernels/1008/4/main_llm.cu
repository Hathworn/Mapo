#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CorrelateDataBackward1_1d_llm.cu"
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
    const int nthreads = 1;
int num = 1;
int item = 1;
int topwidth = XSIZE;
int topheight = YSIZE;
int topchannels = 1;
int max_displacement = 1;
int x_shift = 1;
int neighborhood_grid_width = XSIZE;
int kernel_radius = 1;
int stride1 = 2;
int stride2 = 2;
int bottomwidth = XSIZE;
int bottomheight = YSIZE;
int pbottomwidth = XSIZE;
int pbottomheight = YSIZE;
int bottomchannels = 1;
int bottomcount = 1;
int pad_size = XSIZE*YSIZE;
const float *bottom0 = NULL;
hipMalloc(&bottom0, XSIZE*YSIZE);
float *bottom1diff = NULL;
hipMalloc(&bottom1diff, XSIZE*YSIZE);
const float *topdiff = NULL;
hipMalloc(&topdiff, XSIZE*YSIZE);
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
CorrelateDataBackward1_1d<<<gridBlock, threadBlock>>>(nthreads,num,item,topwidth,topheight,topchannels,max_displacement,x_shift,neighborhood_grid_width,kernel_radius,stride1,stride2,bottomwidth,bottomheight,pbottomwidth,pbottomheight,bottomchannels,bottomcount,pad_size,bottom0,bottom1diff,topdiff);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CorrelateDataBackward1_1d<<<gridBlock, threadBlock>>>(nthreads,num,item,topwidth,topheight,topchannels,max_displacement,x_shift,neighborhood_grid_width,kernel_radius,stride1,stride2,bottomwidth,bottomheight,pbottomwidth,pbottomheight,bottomchannels,bottomcount,pad_size,bottom0,bottom1diff,topdiff);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CorrelateDataBackward1_1d<<<gridBlock, threadBlock>>>(nthreads,num,item,topwidth,topheight,topchannels,max_displacement,x_shift,neighborhood_grid_width,kernel_radius,stride1,stride2,bottomwidth,bottomheight,pbottomwidth,pbottomheight,bottomchannels,bottomcount,pad_size,bottom0,bottom1diff,topdiff);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}