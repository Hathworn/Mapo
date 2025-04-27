#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "returnQ1.cu"
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
    const int dim = 1;
const int n = 1;
const float *p1 = NULL;
hipMalloc(&p1, XSIZE*YSIZE);
const float *p0 = NULL;
hipMalloc(&p0, XSIZE*YSIZE);
const float *s1 = NULL;
hipMalloc(&s1, XSIZE*YSIZE);
const float *s0 = NULL;
hipMalloc(&s0, XSIZE*YSIZE);
const float *zr = NULL;
hipMalloc(&zr, XSIZE*YSIZE);
float *q = NULL;
hipMalloc(&q, XSIZE*YSIZE);
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
returnQ1<<<gridBlock, threadBlock>>>(dim,n,p1,p0,s1,s0,zr,q);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
returnQ1<<<gridBlock, threadBlock>>>(dim,n,p1,p0,s1,s0,zr,q);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
returnQ1<<<gridBlock, threadBlock>>>(dim,n,p1,p0,s1,s0,zr,q);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}