#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "binary_kernel_same_llm.cu"
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
    const float *vg_a = NULL;
hipMalloc(&vg_a, XSIZE*YSIZE);
size_t pitch_a = 2;
size_t n_a = XSIZE;
const float *vg_b = NULL;
hipMalloc(&vg_b, XSIZE*YSIZE);
size_t pitch_b = 2;
size_t n_b = YSIZE;
size_t k = 1;
float *d = NULL;
hipMalloc(&d, XSIZE*YSIZE);
size_t pitch_d = 2;
float p = 1;
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
binary_kernel_same<<<gridBlock, threadBlock>>>(vg_a,pitch_a,n_a,vg_b,pitch_b,n_b,k,d,pitch_d,p);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
binary_kernel_same<<<gridBlock, threadBlock>>>(vg_a,pitch_a,n_a,vg_b,pitch_b,n_b,k,d,pitch_d,p);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
binary_kernel_same<<<gridBlock, threadBlock>>>(vg_a,pitch_a,n_a,vg_b,pitch_b,n_b,k,d,pitch_d,p);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}