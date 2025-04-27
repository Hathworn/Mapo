#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "replace_image_by_distance_kernel.cu"
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
    const unsigned char *pImage = NULL;
hipMalloc(&pImage, XSIZE*YSIZE);
const float *pDepth = NULL;
hipMalloc(&pDepth, XSIZE*YSIZE);
const unsigned char *pBackground = NULL;
hipMalloc(&pBackground, XSIZE*YSIZE);
unsigned char *result = NULL;
hipMalloc(&result, XSIZE*YSIZE);
const float max_value = 1;
const unsigned int width = 1;
const unsigned int height = 1;
const unsigned int image_channels = 1;
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
replace_image_by_distance_kernel<<<gridBlock, threadBlock>>>(pImage,pDepth,pBackground,result,max_value,width,height,image_channels);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
replace_image_by_distance_kernel<<<gridBlock, threadBlock>>>(pImage,pDepth,pBackground,result,max_value,width,height,image_channels);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
replace_image_by_distance_kernel<<<gridBlock, threadBlock>>>(pImage,pDepth,pBackground,result,max_value,width,height,image_channels);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}