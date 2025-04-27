#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculateIntermediates.cu"
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
    int n = XSIZE*YSIZE;
double *xs = NULL;
hipMalloc(&xs, XSIZE*YSIZE);
int *cluster_index = NULL;
hipMalloc(&cluster_index, XSIZE*YSIZE);
int *intermediates0 = NULL;
hipMalloc(&intermediates0, XSIZE*YSIZE);
double *intermediates1 = NULL;
hipMalloc(&intermediates1, XSIZE*YSIZE);
double *intermediates2 = NULL;
hipMalloc(&intermediates2, XSIZE*YSIZE);
int k = 1;
int d = 1;
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
calculateIntermediates<<<gridBlock, threadBlock>>>(n,xs,cluster_index,intermediates0,intermediates1,intermediates2,k,d);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculateIntermediates<<<gridBlock, threadBlock>>>(n,xs,cluster_index,intermediates0,intermediates1,intermediates2,k,d);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculateIntermediates<<<gridBlock, threadBlock>>>(n,xs,cluster_index,intermediates0,intermediates1,intermediates2,k,d);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}