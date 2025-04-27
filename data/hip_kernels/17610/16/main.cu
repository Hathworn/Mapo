#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sortAtomsGenCellListsAlt.cu"
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
    unsigned int natoms = 1;
const float4 *xyzr_d = NULL;
hipMalloc(&xyzr_d, XSIZE*YSIZE);
const float4 *color_d = NULL;
hipMalloc(&color_d, XSIZE*YSIZE);
const unsigned int *atomIndex_d = NULL;
hipMalloc(&atomIndex_d, XSIZE*YSIZE);
unsigned int *sorted_atomIndex_d = NULL;
hipMalloc(&sorted_atomIndex_d, XSIZE*YSIZE);
const unsigned int *atomHash_d = NULL;
hipMalloc(&atomHash_d, XSIZE*YSIZE);
float4 *sorted_xyzr_d = NULL;
hipMalloc(&sorted_xyzr_d, XSIZE*YSIZE);
float4 *sorted_color_d = NULL;
hipMalloc(&sorted_color_d, XSIZE*YSIZE);
uint2 *cellStartEnd_d = NULL;
hipMalloc(&cellStartEnd_d, XSIZE*YSIZE);
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
sortAtomsGenCellListsAlt<<<gridBlock, threadBlock>>>(natoms,xyzr_d,color_d,atomIndex_d,sorted_atomIndex_d,atomHash_d,sorted_xyzr_d,sorted_color_d,cellStartEnd_d);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sortAtomsGenCellListsAlt<<<gridBlock, threadBlock>>>(natoms,xyzr_d,color_d,atomIndex_d,sorted_atomIndex_d,atomHash_d,sorted_xyzr_d,sorted_color_d,cellStartEnd_d);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sortAtomsGenCellListsAlt<<<gridBlock, threadBlock>>>(natoms,xyzr_d,color_d,atomIndex_d,sorted_atomIndex_d,atomHash_d,sorted_xyzr_d,sorted_color_d,cellStartEnd_d);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}