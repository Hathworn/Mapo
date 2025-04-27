#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "normal_eqs_disparity_multicam_GPU_llm.cu"
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
    float *d_CD = NULL;
hipMalloc(&d_CD, XSIZE*YSIZE);
float *d_disparity_compact = NULL;
hipMalloc(&d_disparity_compact, XSIZE*YSIZE);
float4 *d_Zbuffer_normals_compact = NULL;
hipMalloc(&d_Zbuffer_normals_compact, XSIZE*YSIZE);
int *d_ind_disparity_Zbuffer = NULL;
hipMalloc(&d_ind_disparity_Zbuffer, XSIZE*YSIZE);
const float *d_focal_length = NULL;
hipMalloc(&d_focal_length, XSIZE*YSIZE);
const float *d_nodal_point_x = NULL;
hipMalloc(&d_nodal_point_x, XSIZE*YSIZE);
const float *d_nodal_point_y = NULL;
hipMalloc(&d_nodal_point_y, XSIZE*YSIZE);
const float *d_baseline = NULL;
hipMalloc(&d_baseline, XSIZE*YSIZE);
const int *d_n_cols = NULL;
hipMalloc(&d_n_cols, XSIZE*YSIZE);
const int *d_n_values_disparity = NULL;
hipMalloc(&d_n_values_disparity, XSIZE*YSIZE);
const int *d_start_ind_disparity = NULL;
hipMalloc(&d_start_ind_disparity, XSIZE*YSIZE);
const int *d_pixel_ind_offset = NULL;
hipMalloc(&d_pixel_ind_offset, XSIZE*YSIZE);
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
normal_eqs_disparity_multicam_GPU<<<gridBlock, threadBlock>>>(d_CD,d_disparity_compact,d_Zbuffer_normals_compact,d_ind_disparity_Zbuffer,d_focal_length,d_nodal_point_x,d_nodal_point_y,d_baseline,d_n_cols,d_n_values_disparity,d_start_ind_disparity,d_pixel_ind_offset);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
normal_eqs_disparity_multicam_GPU<<<gridBlock, threadBlock>>>(d_CD,d_disparity_compact,d_Zbuffer_normals_compact,d_ind_disparity_Zbuffer,d_focal_length,d_nodal_point_x,d_nodal_point_y,d_baseline,d_n_cols,d_n_values_disparity,d_start_ind_disparity,d_pixel_ind_offset);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
normal_eqs_disparity_multicam_GPU<<<gridBlock, threadBlock>>>(d_CD,d_disparity_compact,d_Zbuffer_normals_compact,d_ind_disparity_Zbuffer,d_focal_length,d_nodal_point_x,d_nodal_point_y,d_baseline,d_n_cols,d_n_values_disparity,d_start_ind_disparity,d_pixel_ind_offset);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}