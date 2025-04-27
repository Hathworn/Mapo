#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "patchmatch2_conv_kernel_llm.cu"
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
    float *A = NULL;
hipMalloc(&A, XSIZE*YSIZE);
float *B = NULL;
hipMalloc(&B, XSIZE*YSIZE);
float *AP = NULL;
hipMalloc(&AP, XSIZE*YSIZE);
float *BP = NULL;
hipMalloc(&BP, XSIZE*YSIZE);
float *conv = NULL;
hipMalloc(&conv, XSIZE*YSIZE);
int *prev_corrAB_upsampled = NULL;
hipMalloc(&prev_corrAB_upsampled, XSIZE*YSIZE);
int patch = 1;
int s_rad = 1;
int c = 2;
int h = YSIZE;
int w = XSIZE;
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
patchmatch2_conv_kernel<<<gridBlock, threadBlock>>>(A,B,AP,BP,conv,prev_corrAB_upsampled,patch,s_rad,c,h,w);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
patchmatch2_conv_kernel<<<gridBlock, threadBlock>>>(A,B,AP,BP,conv,prev_corrAB_upsampled,patch,s_rad,c,h,w);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
patchmatch2_conv_kernel<<<gridBlock, threadBlock>>>(A,B,AP,BP,conv,prev_corrAB_upsampled,patch,s_rad,c,h,w);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}