#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernelKNNshared.cu"
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
    const float *g_uquery = NULL;
hipMalloc(&g_uquery, XSIZE*YSIZE);
const float *g_vpointset = NULL;
hipMalloc(&g_vpointset, XSIZE*YSIZE);
int *g_indexes = NULL;
hipMalloc(&g_indexes, XSIZE*YSIZE);
float *g_distances = NULL;
hipMalloc(&g_distances, XSIZE*YSIZE);
const int pointdim = 1;
const int triallength = 1;
const int signallength = 1;
const int kth = 1;
const int exclude = 1;
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
kernelKNNshared<<<gridBlock, threadBlock>>>(g_uquery,g_vpointset,g_indexes,g_distances,pointdim,triallength,signallength,kth,exclude);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernelKNNshared<<<gridBlock, threadBlock>>>(g_uquery,g_vpointset,g_indexes,g_distances,pointdim,triallength,signallength,kth,exclude);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernelKNNshared<<<gridBlock, threadBlock>>>(g_uquery,g_vpointset,g_indexes,g_distances,pointdim,triallength,signallength,kth,exclude);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}