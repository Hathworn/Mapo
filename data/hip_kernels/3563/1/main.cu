#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "spmv_csr_vector_kernel.cu"
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
    unsigned int computation_restriction_factor = 1;
const unsigned int *cum_row_indexes = NULL;
hipMalloc(&cum_row_indexes, XSIZE*YSIZE);
const unsigned int *column_indexes = NULL;
hipMalloc(&column_indexes, XSIZE*YSIZE);
const float *matrix_data = NULL;
hipMalloc(&matrix_data, XSIZE*YSIZE);
const float *in_vector = NULL;
hipMalloc(&in_vector, XSIZE*YSIZE);
float *out_vector = NULL;
hipMalloc(&out_vector, XSIZE*YSIZE);
const unsigned int outerdim = 1;
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
spmv_csr_vector_kernel<<<gridBlock, threadBlock>>>(computation_restriction_factor,cum_row_indexes,column_indexes,matrix_data,in_vector,out_vector,outerdim);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
spmv_csr_vector_kernel<<<gridBlock, threadBlock>>>(computation_restriction_factor,cum_row_indexes,column_indexes,matrix_data,in_vector,out_vector,outerdim);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
spmv_csr_vector_kernel<<<gridBlock, threadBlock>>>(computation_restriction_factor,cum_row_indexes,column_indexes,matrix_data,in_vector,out_vector,outerdim);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}