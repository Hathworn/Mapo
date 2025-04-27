#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "gpu_stencil37_hack2_cp_rows_llm.cu"
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
    double *dst = NULL;
hipMalloc(&dst, XSIZE*YSIZE);
double *shared_rows = NULL;
hipMalloc(&shared_rows, XSIZE*YSIZE);
double *shared_cols = NULL;
hipMalloc(&shared_cols, XSIZE*YSIZE);
double *shared_slices = NULL;
hipMalloc(&shared_slices, XSIZE*YSIZE);
int d_xpitch = 2;
int d_ypitch = 2;
int d_zpitch = 2;
int s_xpitch = 2;
int s_ypitch = 2;
int s_zpitch = 2;
int n_rows = 1;
int n_cols = 1;
int n_slices = 1;
int tile_x = 1;
int tile_y = 1;
int tile_z = 1;
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
gpu_stencil37_hack2_cp_rows<<<gridBlock, threadBlock>>>(dst,shared_rows,shared_cols,shared_slices,d_xpitch,d_ypitch,d_zpitch,s_xpitch,s_ypitch,s_zpitch,n_rows,n_cols,n_slices,tile_x,tile_y,tile_z);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
gpu_stencil37_hack2_cp_rows<<<gridBlock, threadBlock>>>(dst,shared_rows,shared_cols,shared_slices,d_xpitch,d_ypitch,d_zpitch,s_xpitch,s_ypitch,s_zpitch,n_rows,n_cols,n_slices,tile_x,tile_y,tile_z);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
gpu_stencil37_hack2_cp_rows<<<gridBlock, threadBlock>>>(dst,shared_rows,shared_cols,shared_slices,d_xpitch,d_ypitch,d_zpitch,s_xpitch,s_ypitch,s_zpitch,n_rows,n_cols,n_slices,tile_x,tile_y,tile_z);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}