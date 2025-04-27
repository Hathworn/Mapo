#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "set_segmented_nnz_num.cu"
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
    int *d_rpt = NULL;
hipMalloc(&d_rpt, XSIZE*YSIZE);
int *d_col = NULL;
hipMalloc(&d_col, XSIZE*YSIZE);
int *d_nnz_num = NULL;
hipMalloc(&d_nnz_num, XSIZE*YSIZE);
int *d_group_seg = NULL;
hipMalloc(&d_group_seg, XSIZE*YSIZE);
int *d_offset = NULL;
hipMalloc(&d_offset, XSIZE*YSIZE);
size_t seg_size = XSIZE*YSIZE;
size_t seg_num = 1;
int M = 2;
int pad_M = 1;
int group_num_col = 1;
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
set_segmented_nnz_num<<<gridBlock, threadBlock>>>(d_rpt,d_col,d_nnz_num,d_group_seg,d_offset,seg_size,seg_num,M,pad_M,group_num_col);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
set_segmented_nnz_num<<<gridBlock, threadBlock>>>(d_rpt,d_col,d_nnz_num,d_group_seg,d_offset,seg_size,seg_num,M,pad_M,group_num_col);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
set_segmented_nnz_num<<<gridBlock, threadBlock>>>(d_rpt,d_col,d_nnz_num,d_group_seg,d_offset,seg_size,seg_num,M,pad_M,group_num_col);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}