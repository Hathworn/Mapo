#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "flow_absolute_residual_scalable_GPU.cu"
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
    float *d_abs_res = NULL;
hipMalloc(&d_abs_res, XSIZE*YSIZE);
const float2 *d_flow_compact = NULL;
hipMalloc(&d_flow_compact, XSIZE*YSIZE);
const float *d_Zbuffer_flow_compact = NULL;
hipMalloc(&d_Zbuffer_flow_compact, XSIZE*YSIZE);
const int *d_ind_flow_Zbuffer = NULL;
hipMalloc(&d_ind_flow_Zbuffer, XSIZE*YSIZE);
const unsigned int *d_valid_flow_Zbuffer = NULL;
hipMalloc(&d_valid_flow_Zbuffer, XSIZE*YSIZE);
float fx = 1;
float fy = 1;
float ox = 1;
float oy = 1;
int n_rows = 1;
int n_cols = 1;
int n_valid_flow_Zbuffer = 1;
const int *d_offset_ind = NULL;
hipMalloc(&d_offset_ind, XSIZE*YSIZE);
const int *d_segment_translation_table = NULL;
hipMalloc(&d_segment_translation_table, XSIZE*YSIZE);
float w_flow = 1;
float w_ar_flow = 1;
const float *d_dTR = NULL;
hipMalloc(&d_dTR, XSIZE*YSIZE);
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
flow_absolute_residual_scalable_GPU<<<gridBlock, threadBlock>>>(d_abs_res,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,d_valid_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,n_valid_flow_Zbuffer,d_offset_ind,d_segment_translation_table,w_flow,w_ar_flow,d_dTR);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
flow_absolute_residual_scalable_GPU<<<gridBlock, threadBlock>>>(d_abs_res,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,d_valid_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,n_valid_flow_Zbuffer,d_offset_ind,d_segment_translation_table,w_flow,w_ar_flow,d_dTR);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
flow_absolute_residual_scalable_GPU<<<gridBlock, threadBlock>>>(d_abs_res,d_flow_compact,d_Zbuffer_flow_compact,d_ind_flow_Zbuffer,d_valid_flow_Zbuffer,fx,fy,ox,oy,n_rows,n_cols,n_valid_flow_Zbuffer,d_offset_ind,d_segment_translation_table,w_flow,w_ar_flow,d_dTR);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}