#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compute_d_vector_kernel.cu"
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
    int N_i = 1;
int *d_ind = NULL;
hipMalloc(&d_ind, XSIZE*YSIZE);
double *d_ptr = NULL;
hipMalloc(&d_ptr, XSIZE*YSIZE);
int *p_ptr = NULL;
hipMalloc(&p_ptr, XSIZE*YSIZE);
double *N_ptr = NULL;
hipMalloc(&N_ptr, XSIZE*YSIZE);
int N_ld = 1;
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
compute_d_vector_kernel<<<gridBlock, threadBlock>>>(N_i,d_ind,d_ptr,p_ptr,N_ptr,N_ld);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compute_d_vector_kernel<<<gridBlock, threadBlock>>>(N_i,d_ind,d_ptr,p_ptr,N_ptr,N_ld);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compute_d_vector_kernel<<<gridBlock, threadBlock>>>(N_i,d_ind,d_ptr,p_ptr,N_ptr,N_ld);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}