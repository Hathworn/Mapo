#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "copyPixelsInSlicesRGB_llm.cu"
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
    float *ptrinput0 = NULL;
hipMalloc(&ptrinput0, XSIZE*YSIZE);
float *ptrkslices0 = NULL;
hipMalloc(&ptrkslices0, XSIZE*YSIZE);
int dH = 1;
int dW = 1;
int kH = 1;
int kW = 1;
int size1 = XSIZE*YSIZE;
int size2 = XSIZE*YSIZE;
int isize1 = XSIZE*YSIZE;
int isize2 = XSIZE*YSIZE;
int nInputPlane = 1;
int padleft = 1;
int padright = 1;
int padup = 1;
int paddown = 1;
int inputstr0 = 1;
int kslicesstr0 = 1;
int batchsize = XSIZE*YSIZE;
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
copyPixelsInSlicesRGB<<<gridBlock, threadBlock>>>(ptrinput0,ptrkslices0,dH,dW,kH,kW,size1,size2,isize1,isize2,nInputPlane,padleft,padright,padup,paddown,inputstr0,kslicesstr0,batchsize);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
copyPixelsInSlicesRGB<<<gridBlock, threadBlock>>>(ptrinput0,ptrkslices0,dH,dW,kH,kW,size1,size2,isize1,isize2,nInputPlane,padleft,padright,padup,paddown,inputstr0,kslicesstr0,batchsize);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
copyPixelsInSlicesRGB<<<gridBlock, threadBlock>>>(ptrinput0,ptrkslices0,dH,dW,kH,kW,size1,size2,isize1,isize2,nInputPlane,padleft,padright,padup,paddown,inputstr0,kslicesstr0,batchsize);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}