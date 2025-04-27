#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compute_row_on_Gamma_matrix_kernel_llm.cu"
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
    int row_index = 1;
int vertex_index = 1;
int *indices = NULL;
hipMalloc(&indices, XSIZE*YSIZE);
double *exp_V = NULL;
hipMalloc(&exp_V, XSIZE*YSIZE);
double *N_ptr = NULL;
hipMalloc(&N_ptr, XSIZE*YSIZE);
int LD_N = 1;
double *G_ptr = NULL;
hipMalloc(&G_ptr, XSIZE*YSIZE);
int LD_G = 1;
double *row_ptr = NULL;
hipMalloc(&row_ptr, XSIZE*YSIZE);
int incr = 1;
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
compute_row_on_Gamma_matrix_kernel<<<gridBlock, threadBlock>>>(row_index,vertex_index,indices,exp_V,N_ptr,LD_N,G_ptr,LD_G,row_ptr,incr);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compute_row_on_Gamma_matrix_kernel<<<gridBlock, threadBlock>>>(row_index,vertex_index,indices,exp_V,N_ptr,LD_N,G_ptr,LD_G,row_ptr,incr);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compute_row_on_Gamma_matrix_kernel<<<gridBlock, threadBlock>>>(row_index,vertex_index,indices,exp_V,N_ptr,LD_N,G_ptr,LD_G,row_ptr,incr);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}