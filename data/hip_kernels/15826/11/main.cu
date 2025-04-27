#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compute_G_cols_kernel.cu"
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
int N_r = 1;
int N_c = 1;
int *p_ptr = NULL;
hipMalloc(&p_ptr, XSIZE*YSIZE);
double *exp_V_ptr = NULL;
hipMalloc(&exp_V_ptr, XSIZE*YSIZE);
double *N_ptr = NULL;
hipMalloc(&N_ptr, XSIZE*YSIZE);
int N_ld = 1;
double *G_ptr = NULL;
hipMalloc(&G_ptr, XSIZE*YSIZE);
int G_ld = 1;
double *G_cols_ptr = NULL;
hipMalloc(&G_cols_ptr, XSIZE*YSIZE);
int G_cols_ld = 1;
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
compute_G_cols_kernel<<<gridBlock, threadBlock>>>(N_i,N_r,N_c,p_ptr,exp_V_ptr,N_ptr,N_ld,G_ptr,G_ld,G_cols_ptr,G_cols_ld);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compute_G_cols_kernel<<<gridBlock, threadBlock>>>(N_i,N_r,N_c,p_ptr,exp_V_ptr,N_ptr,N_ld,G_ptr,G_ld,G_cols_ptr,G_cols_ld);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compute_G_cols_kernel<<<gridBlock, threadBlock>>>(N_i,N_r,N_c,p_ptr,exp_V_ptr,N_ptr,N_ld,G_ptr,G_ld,G_cols_ptr,G_cols_ld);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}