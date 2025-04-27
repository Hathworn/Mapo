#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaKernelPull.cu"
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
    float *mat = NULL;
hipMalloc(&mat, XSIZE*YSIZE);
float *spins = NULL;
hipMalloc(&spins, XSIZE*YSIZE);
int size = XSIZE*YSIZE;
float *temp = NULL;
hipMalloc(&temp, XSIZE*YSIZE);
float tempStep = 1;
float *meanFieldElements = NULL;
hipMalloc(&meanFieldElements, XSIZE*YSIZE);
bool *continueIteration = NULL;
hipMalloc(&continueIteration, XSIZE*YSIZE);
float minDiff = 1;
int *unemptyCells = NULL;
hipMalloc(&unemptyCells, XSIZE*YSIZE);
float linearCoef = 1;
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
cudaKernelPull<<<gridBlock, threadBlock>>>(mat,spins,size,temp,tempStep,meanFieldElements,continueIteration,minDiff,unemptyCells,linearCoef);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaKernelPull<<<gridBlock, threadBlock>>>(mat,spins,size,temp,tempStep,meanFieldElements,continueIteration,minDiff,unemptyCells,linearCoef);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaKernelPull<<<gridBlock, threadBlock>>>(mat,spins,size,temp,tempStep,meanFieldElements,continueIteration,minDiff,unemptyCells,linearCoef);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}