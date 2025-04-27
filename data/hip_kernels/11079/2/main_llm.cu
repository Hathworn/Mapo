#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "log_motion_estimation_cuda_llm.cu"
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
    uint8 *current = NULL;
hipMalloc(&current, XSIZE*YSIZE);
uint8 *previous = NULL;
hipMalloc(&previous, XSIZE*YSIZE);
int *vectors_x = NULL;
hipMalloc(&vectors_x, XSIZE*YSIZE);
int *vectors_y = NULL;
hipMalloc(&vectors_y, XSIZE*YSIZE);
int *M_B = NULL;
hipMalloc(&M_B, XSIZE*YSIZE);
int *N_B = NULL;
hipMalloc(&N_B, XSIZE*YSIZE);
int *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
int *M = NULL;
hipMalloc(&M, XSIZE*YSIZE);
int *N = NULL;
hipMalloc(&N, XSIZE*YSIZE);
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
log_motion_estimation_cuda<<<gridBlock, threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
log_motion_estimation_cuda<<<gridBlock, threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
log_motion_estimation_cuda<<<gridBlock, threadBlock>>>(current,previous,vectors_x,vectors_y,M_B,N_B,B,M,N);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}