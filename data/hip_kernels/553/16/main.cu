#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "CalculateFixed.cu"
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
    const float *subBG = NULL;
hipMalloc(&subBG, XSIZE*YSIZE);
const float *subT = NULL;
hipMalloc(&subT, XSIZE*YSIZE);
const int *subM = NULL;
hipMalloc(&subM, XSIZE*YSIZE);
float *fixed = NULL;
hipMalloc(&fixed, XSIZE*YSIZE);
const int wb = 1;
const int hb = 1;
const int wt = 1;
const int ht = 1;
const int oy = 1;
const int ox = 1;
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
CalculateFixed<<<gridBlock, threadBlock>>>(subBG,subT,subM,fixed,wb,hb,wt,ht,oy,ox);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
CalculateFixed<<<gridBlock, threadBlock>>>(subBG,subT,subM,fixed,wb,hb,wt,ht,oy,ox);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
CalculateFixed<<<gridBlock, threadBlock>>>(subBG,subT,subM,fixed,wb,hb,wt,ht,oy,ox);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}