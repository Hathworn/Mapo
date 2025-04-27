#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "scan_large_sum_kernel.cu"
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
    unsigned int *output_block = NULL;
hipMalloc(&output_block, XSIZE*YSIZE);
unsigned int *output_val = NULL;
hipMalloc(&output_val, XSIZE*YSIZE);
unsigned int *output_pos = NULL;
hipMalloc(&output_pos, XSIZE*YSIZE);
unsigned int *input_val = NULL;
hipMalloc(&input_val, XSIZE*YSIZE);
unsigned int *input_pos = NULL;
hipMalloc(&input_pos, XSIZE*YSIZE);
unsigned int *histogram = NULL;
hipMalloc(&histogram, XSIZE*YSIZE);
unsigned int pass = 1;
unsigned int block_num = 1;
unsigned int size = 1;
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
scan_large_sum_kernel<<<gridBlock, threadBlock>>>(output_block,output_val,output_pos,input_val,input_pos,histogram,pass,block_num,size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
scan_large_sum_kernel<<<gridBlock, threadBlock>>>(output_block,output_val,output_pos,input_val,input_pos,histogram,pass,block_num,size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
scan_large_sum_kernel<<<gridBlock, threadBlock>>>(output_block,output_val,output_pos,input_val,input_pos,histogram,pass,block_num,size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}