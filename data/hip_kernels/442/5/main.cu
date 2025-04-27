#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "remap_reduction.cu"
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
    uint32_t *d_reduction = NULL;
hipMalloc(&d_reduction, XSIZE*YSIZE);
uint32_t *d_mapping = NULL;
hipMalloc(&d_mapping, XSIZE*YSIZE);
uint32_t *old_d_ij_buf = NULL;
hipMalloc(&old_d_ij_buf, XSIZE*YSIZE);
uint32_t sum_prev_size = XSIZE*YSIZE;
uint32_t prev_size = XSIZE*YSIZE;
uint32_t *new_d_ij_buf = NULL;
hipMalloc(&new_d_ij_buf, XSIZE*YSIZE);
uint32_t new_size = XSIZE*YSIZE;
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
remap_reduction<<<gridBlock, threadBlock>>>(d_reduction,d_mapping,old_d_ij_buf,sum_prev_size,prev_size,new_d_ij_buf,new_size);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
remap_reduction<<<gridBlock, threadBlock>>>(d_reduction,d_mapping,old_d_ij_buf,sum_prev_size,prev_size,new_d_ij_buf,new_size);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
remap_reduction<<<gridBlock, threadBlock>>>(d_reduction,d_mapping,old_d_ij_buf,sum_prev_size,prev_size,new_d_ij_buf,new_size);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}