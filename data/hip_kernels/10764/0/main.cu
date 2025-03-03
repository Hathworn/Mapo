#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "cvlUnit.cu"
#include<chrono>
#include<iostream>
using namespace std;
using namespace std::chrono;
int blocks_[20][2] = {{8,8},{16,16},{24,24},{32,32},{1,64},{1,128},{1,192},{1,256},{1,320},{1,384},{1,448},{1,512},{1,576},{1,640},{1,704},{1,768},{1,832},{1,896},{1,960},{1,1024}};
int matrices_[7][2] = {{240,240},{496,496},{784,784},{1016,1016},{1232,1232},{1680,1680},{2024,2024}};
int main(int argc, char **argv) {
hipSetDevice(0);
char* p;int matrix_len=strtol(argv[1], &p, 10);
for(int matrix_looper=0;matrix_looper<matrix_len;matrix_looper++){
for(int block_looper=0;block_looper<20;block_looper++){
int XSIZE=matrices_[matrix_looper][0],YSIZE=matrices_[matrix_looper][1],BLOCKX=blocks_[block_looper][0],BLOCKY=blocks_[block_looper][1];
const char *imgR = NULL;
hipMalloc(&imgR, XSIZE*YSIZE);
const char *imgG = NULL;
hipMalloc(&imgG, XSIZE*YSIZE);
const char *imgB = NULL;
hipMalloc(&imgB, XSIZE*YSIZE);
const char *core = NULL;
hipMalloc(&core, XSIZE*YSIZE);
char *outR = NULL;
hipMalloc(&outR, XSIZE*YSIZE);
char *outG = NULL;
hipMalloc(&outG, XSIZE*YSIZE);
char *outB = NULL;
hipMalloc(&outB, XSIZE*YSIZE);
int lenX = 1;
int lenY = 1;
int lenCore = 1;
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0)
{
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0)
{
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
cvlUnit<<<gridBlock,threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
cvlUnit<<<gridBlock,threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
cvlUnit<<<gridBlock,threadBlock>>>(imgR,imgG,imgB,core,outR,outG,outB,lenX,lenY,lenCore);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}