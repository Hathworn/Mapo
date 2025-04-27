#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kGenerateTranslationsBigVarOff.cu"
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
    float *source = NULL;
hipMalloc(&source, XSIZE*YSIZE);
float *target = NULL;
hipMalloc(&target, XSIZE*YSIZE);
float *off_x_arr = NULL;
hipMalloc(&off_x_arr, XSIZE*YSIZE);
float *off_y_arr = NULL;
hipMalloc(&off_y_arr, XSIZE*YSIZE);
int source_w = 1;
int target_w = 1;
int num_channels = 1;
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
kGenerateTranslationsBigVarOff<<<gridBlock, threadBlock>>>(source,target,off_x_arr,off_y_arr,source_w,target_w,num_channels);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kGenerateTranslationsBigVarOff<<<gridBlock, threadBlock>>>(source,target,off_x_arr,off_y_arr,source_w,target_w,num_channels);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kGenerateTranslationsBigVarOff<<<gridBlock, threadBlock>>>(source,target,off_x_arr,off_y_arr,source_w,target_w,num_channels);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}