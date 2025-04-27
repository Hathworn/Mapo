#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "k_reorder_send_buf_total.cu"
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
    int nr_prts = 1;
int nr_total_blocks = 1;
uint *d_bidx = NULL;
hipMalloc(&d_bidx, XSIZE*YSIZE);
uint *d_sums = NULL;
hipMalloc(&d_sums, XSIZE*YSIZE);
float4 *d_xi4 = NULL;
hipMalloc(&d_xi4, XSIZE*YSIZE);
float4 *d_pxi4 = NULL;
hipMalloc(&d_pxi4, XSIZE*YSIZE);
float4 *d_xchg_xi4 = NULL;
hipMalloc(&d_xchg_xi4, XSIZE*YSIZE);
float4 *d_xchg_pxi4 = NULL;
hipMalloc(&d_xchg_pxi4, XSIZE*YSIZE);
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
k_reorder_send_buf_total<<<gridBlock, threadBlock>>>(nr_prts,nr_total_blocks,d_bidx,d_sums,d_xi4,d_pxi4,d_xchg_xi4,d_xchg_pxi4);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
k_reorder_send_buf_total<<<gridBlock, threadBlock>>>(nr_prts,nr_total_blocks,d_bidx,d_sums,d_xi4,d_pxi4,d_xchg_xi4,d_xchg_pxi4);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
k_reorder_send_buf_total<<<gridBlock, threadBlock>>>(nr_prts,nr_total_blocks,d_bidx,d_sums,d_xi4,d_pxi4,d_xchg_xi4,d_xchg_pxi4);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}