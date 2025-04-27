#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "calculate_sumterm_part.cu"
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
    float2 *Up = NULL;
hipMalloc(&Up, XSIZE*YSIZE);
float2 *Vpl = NULL;
hipMalloc(&Vpl, XSIZE*YSIZE);
const float2 *A_t = NULL;
hipMalloc(&A_t, XSIZE*YSIZE);
const float *SR = NULL;
hipMalloc(&SR, XSIZE*YSIZE);
const unsigned char *nonzero_midx1234s = NULL;
hipMalloc(&nonzero_midx1234s, XSIZE*YSIZE);
const unsigned int N = 1;
const unsigned int M = 1;
const float SK_factor = 1;
const unsigned int NUM_NONZERO = 1;
const unsigned int NUM_MODES = 1;
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
calculate_sumterm_part<<<gridBlock, threadBlock>>>(Up,Vpl,A_t,SR,nonzero_midx1234s,N,M,SK_factor,NUM_NONZERO,NUM_MODES);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
calculate_sumterm_part<<<gridBlock, threadBlock>>>(Up,Vpl,A_t,SR,nonzero_midx1234s,N,M,SK_factor,NUM_NONZERO,NUM_MODES);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
calculate_sumterm_part<<<gridBlock, threadBlock>>>(Up,Vpl,A_t,SR,nonzero_midx1234s,N,M,SK_factor,NUM_NONZERO,NUM_MODES);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}