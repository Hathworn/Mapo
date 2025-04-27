#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scatter_llm.cu"
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
    int *d_array = NULL;
hipMalloc(&d_array, XSIZE*YSIZE);
int *d_scanArray = NULL;
hipMalloc(&d_scanArray, XSIZE*YSIZE);
int *d_predicateArrry = NULL;
hipMalloc(&d_predicateArrry, XSIZE*YSIZE);
int *d_scatteredArray = NULL;
hipMalloc(&d_scatteredArray, XSIZE*YSIZE);
int d_numberOfElements = 1;
int offset = 2;
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
scatter<<<gridBlock, threadBlock>>>(d_array,d_scanArray,d_predicateArrry,d_scatteredArray,d_numberOfElements,offset);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scatter<<<gridBlock, threadBlock>>>(d_array,d_scanArray,d_predicateArrry,d_scatteredArray,d_numberOfElements,offset);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scatter<<<gridBlock, threadBlock>>>(d_array,d_scanArray,d_predicateArrry,d_scatteredArray,d_numberOfElements,offset);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}