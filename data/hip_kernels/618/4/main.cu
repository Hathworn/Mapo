#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_computeDesctriptorCUDARot.cu"
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
    bool *_d_isdescriptor = NULL;
hipMalloc(&_d_isdescriptor, XSIZE*YSIZE);
char *_d_vdescriptor = NULL;
hipMalloc(&_d_vdescriptor, XSIZE*YSIZE);
int *_d_keypointsIndexX = NULL;
hipMalloc(&_d_keypointsIndexX, XSIZE*YSIZE);
int *_d_keypointsIndexY = NULL;
hipMalloc(&_d_keypointsIndexY, XSIZE*YSIZE);
int *_d_keypointsRotation = NULL;
hipMalloc(&_d_keypointsRotation, XSIZE*YSIZE);
int _amountofkeypoints = 1;
unsigned int *_d_integralImage = NULL;
hipMalloc(&_d_integralImage, XSIZE*YSIZE);
int _d_width = XSIZE;
int _d_height = YSIZE;
float _scale = 2;
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
kernel_computeDesctriptorCUDARot<<<gridBlock, threadBlock>>>(_d_isdescriptor,_d_vdescriptor,_d_keypointsIndexX,_d_keypointsIndexY,_d_keypointsRotation,_amountofkeypoints,_d_integralImage,_d_width,_d_height,_scale);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_computeDesctriptorCUDARot<<<gridBlock, threadBlock>>>(_d_isdescriptor,_d_vdescriptor,_d_keypointsIndexX,_d_keypointsIndexY,_d_keypointsRotation,_amountofkeypoints,_d_integralImage,_d_width,_d_height,_scale);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_computeDesctriptorCUDARot<<<gridBlock, threadBlock>>>(_d_isdescriptor,_d_vdescriptor,_d_keypointsIndexX,_d_keypointsIndexY,_d_keypointsRotation,_amountofkeypoints,_d_integralImage,_d_width,_d_height,_scale);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}