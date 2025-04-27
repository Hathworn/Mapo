#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "findDesirabilityKernel_llm.cu"
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
    int size = XSIZE*YSIZE;
int optimalSize = XSIZE*YSIZE;
int *adjIndexes = NULL;
hipMalloc(&adjIndexes, XSIZE*YSIZE);
int *adjacency = NULL;
hipMalloc(&adjacency, XSIZE*YSIZE);
int *partition = NULL;
hipMalloc(&partition, XSIZE*YSIZE);
int *partSizes = NULL;
hipMalloc(&partSizes, XSIZE*YSIZE);
int *nodeWeights = NULL;
hipMalloc(&nodeWeights, XSIZE*YSIZE);
int *swap_to = NULL;
hipMalloc(&swap_to, XSIZE*YSIZE);
int *swap_from = NULL;
hipMalloc(&swap_from, XSIZE*YSIZE);
int *swap_index = NULL;
hipMalloc(&swap_index, XSIZE*YSIZE);
float *desirability = NULL;
hipMalloc(&desirability, XSIZE*YSIZE);
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
findDesirabilityKernel<<<gridBlock, threadBlock>>>(size,optimalSize,adjIndexes,adjacency,partition,partSizes,nodeWeights,swap_to,swap_from,swap_index,desirability);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
findDesirabilityKernel<<<gridBlock, threadBlock>>>(size,optimalSize,adjIndexes,adjacency,partition,partSizes,nodeWeights,swap_to,swap_from,swap_index,desirability);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
findDesirabilityKernel<<<gridBlock, threadBlock>>>(size,optimalSize,adjIndexes,adjacency,partition,partSizes,nodeWeights,swap_to,swap_from,swap_index,desirability);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}