#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "kernel_vec_equals_vec1_plus_alpha_times_vec2.cu"
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
    double *vec = NULL;
hipMalloc(&vec, XSIZE*YSIZE);
double *vec1 = NULL;
hipMalloc(&vec1, XSIZE*YSIZE);
double alpha = 2;
double *d_a1 = NULL;
hipMalloc(&d_a1, XSIZE*YSIZE);
double *vec2 = NULL;
hipMalloc(&vec2, XSIZE*YSIZE);
int numElements = 1;
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
kernel_vec_equals_vec1_plus_alpha_times_vec2<<<gridBlock, threadBlock>>>(vec,vec1,alpha,d_a1,vec2,numElements);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
kernel_vec_equals_vec1_plus_alpha_times_vec2<<<gridBlock, threadBlock>>>(vec,vec1,alpha,d_a1,vec2,numElements);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
kernel_vec_equals_vec1_plus_alpha_times_vec2<<<gridBlock, threadBlock>>>(vec,vec1,alpha,d_a1,vec2,numElements);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}