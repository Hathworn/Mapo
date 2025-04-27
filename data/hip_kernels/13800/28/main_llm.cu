#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "splitRearrange_llm.cu"
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
    int numElems = 1;
int iter = 1;
unsigned int *keys_i = NULL;
hipMalloc(&keys_i, XSIZE*YSIZE);
unsigned int *keys_o = NULL;
hipMalloc(&keys_o, XSIZE*YSIZE);
unsigned int *values_i = NULL;
hipMalloc(&values_i, XSIZE*YSIZE);
unsigned int *values_o = NULL;
hipMalloc(&values_o, XSIZE*YSIZE);
unsigned int *histo = NULL;
hipMalloc(&histo, XSIZE*YSIZE);
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
splitRearrange<<<gridBlock, threadBlock>>>(numElems,iter,keys_i,keys_o,values_i,values_o,histo);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
splitRearrange<<<gridBlock, threadBlock>>>(numElems,iter,keys_i,keys_o,values_i,values_o,histo);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
splitRearrange<<<gridBlock, threadBlock>>>(numElems,iter,keys_i,keys_o,values_i,values_o,histo);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}