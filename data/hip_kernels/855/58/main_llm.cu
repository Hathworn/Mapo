#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "compress_s_write_permutation_llm.cu"
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
    unsigned short *d_s_write_permutation = NULL;
hipMalloc(&d_s_write_permutation, XSIZE*YSIZE);
unsigned short *d_s_write_permutation_offset = NULL;
hipMalloc(&d_s_write_permutation_offset, XSIZE*YSIZE);
int *d_write_permutation = NULL;
hipMalloc(&d_write_permutation, XSIZE*YSIZE);
int c_size = XSIZE*YSIZE;
int chunk = 1;
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
compress_s_write_permutation<<<gridBlock, threadBlock>>>(d_s_write_permutation,d_s_write_permutation_offset,d_write_permutation,c_size,chunk);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
compress_s_write_permutation<<<gridBlock, threadBlock>>>(d_s_write_permutation,d_s_write_permutation_offset,d_write_permutation,c_size,chunk);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
compress_s_write_permutation<<<gridBlock, threadBlock>>>(d_s_write_permutation,d_s_write_permutation_offset,d_write_permutation,c_size,chunk);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}