#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "rectified_linear_backprop_upd_kernel.cu"
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
    float4 __restrict *input_errors = NULL;
hipMalloc(&input_errors, XSIZE*YSIZE);
const float4 __restrict *output_errors = NULL;
hipMalloc(&output_errors, XSIZE*YSIZE);
const uint4 __restrict *bits_buffer = NULL;
hipMalloc(&bits_buffer, XSIZE*YSIZE);
float negative_slope = 1;
bool add_update_to_destination = 1;
int elem_count = 1;
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
rectified_linear_backprop_upd_kernel<<<gridBlock, threadBlock>>>(input_errors,output_errors,bits_buffer,negative_slope,add_update_to_destination,elem_count);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
rectified_linear_backprop_upd_kernel<<<gridBlock, threadBlock>>>(input_errors,output_errors,bits_buffer,negative_slope,add_update_to_destination,elem_count);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
rectified_linear_backprop_upd_kernel<<<gridBlock, threadBlock>>>(input_errors,output_errors,bits_buffer,negative_slope,add_update_to_destination,elem_count);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}