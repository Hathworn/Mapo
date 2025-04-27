#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "ReplaceKernelA.cu"
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
    const float *p_Input = NULL;
hipMalloc(&p_Input, XSIZE*YSIZE);
float *p_Output = NULL;
hipMalloc(&p_Output, XSIZE*YSIZE);
int p_Width = XSIZE;
int p_Height = YSIZE;
float hueRangeA = 1;
float hueRangeB = 1;
float hueRangeWithRollOffA = 1;
float hueRangeWithRollOffB = 1;
float satRangeA = 1;
float satRangeB = 1;
float satRolloff = 1;
float valRangeA = 1;
float valRangeB = 1;
float valRolloff = 1;
int OutputAlpha = 2;
int DisplayAlpha = 2;
float p_Black = 1;
float p_White = 1;
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
ReplaceKernelA<<<gridBlock, threadBlock>>>(p_Input,p_Output,p_Width,p_Height,hueRangeA,hueRangeB,hueRangeWithRollOffA,hueRangeWithRollOffB,satRangeA,satRangeB,satRolloff,valRangeA,valRangeB,valRolloff,OutputAlpha,DisplayAlpha,p_Black,p_White);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
ReplaceKernelA<<<gridBlock, threadBlock>>>(p_Input,p_Output,p_Width,p_Height,hueRangeA,hueRangeB,hueRangeWithRollOffA,hueRangeWithRollOffB,satRangeA,satRangeB,satRolloff,valRangeA,valRangeB,valRolloff,OutputAlpha,DisplayAlpha,p_Black,p_White);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
ReplaceKernelA<<<gridBlock, threadBlock>>>(p_Input,p_Output,p_Width,p_Height,hueRangeA,hueRangeB,hueRangeWithRollOffA,hueRangeWithRollOffB,satRangeA,satRangeB,satRolloff,valRangeA,valRangeB,valRolloff,OutputAlpha,DisplayAlpha,p_Black,p_White);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}