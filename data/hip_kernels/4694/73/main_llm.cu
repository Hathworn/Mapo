#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compact2d_1D_array_llm.cu"
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
    int *input = NULL;
hipMalloc(&input, XSIZE*YSIZE);
int *output = NULL;
hipMalloc(&output, XSIZE*YSIZE);
int *output_column_index_array = NULL;
hipMalloc(&output_column_index_array, XSIZE*YSIZE);
int *output_row_index_array = NULL;
hipMalloc(&output_row_index_array, XSIZE*YSIZE);
int *prev_output_index_array = NULL;
hipMalloc(&prev_output_index_array, XSIZE*YSIZE);
int *auxiliry_array = NULL;
hipMalloc(&auxiliry_array, XSIZE*YSIZE);
int array_size = XSIZE*YSIZE;
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
compact2d_1D_array<<<gridBlock, threadBlock>>>(input,output,output_column_index_array,output_row_index_array,prev_output_index_array,auxiliry_array,array_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compact2d_1D_array<<<gridBlock, threadBlock>>>(input,output,output_column_index_array,output_row_index_array,prev_output_index_array,auxiliry_array,array_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compact2d_1D_array<<<gridBlock, threadBlock>>>(input,output,output_column_index_array,output_row_index_array,prev_output_index_array,auxiliry_array,array_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}