#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "breadth_first_search_csr_gpu.cu"
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
    unsigned int *cum_row_indexes = NULL;
hipMalloc(&cum_row_indexes, XSIZE*YSIZE);
unsigned int *column_indexes = NULL;
hipMalloc(&column_indexes, XSIZE*YSIZE);
int *matrix_data = NULL;
hipMalloc(&matrix_data, XSIZE*YSIZE);
unsigned int *in_infections = NULL;
hipMalloc(&in_infections, XSIZE*YSIZE);
unsigned int *out_infections = NULL;
hipMalloc(&out_infections, XSIZE*YSIZE);
unsigned int rows = 1;
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
breadth_first_search_csr_gpu<<<gridBlock, threadBlock>>>(cum_row_indexes,column_indexes,matrix_data,in_infections,out_infections,rows);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
breadth_first_search_csr_gpu<<<gridBlock, threadBlock>>>(cum_row_indexes,column_indexes,matrix_data,in_infections,out_infections,rows);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
breadth_first_search_csr_gpu<<<gridBlock, threadBlock>>>(cum_row_indexes,column_indexes,matrix_data,in_infections,out_infections,rows);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}