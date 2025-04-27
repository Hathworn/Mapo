#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "convertPointCloudToDepthImage_kernel_llm.cu"
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
    unsigned int *depth_image = NULL;
hipMalloc(&depth_image, XSIZE*YSIZE);
const float4 *point_cloud = NULL;
hipMalloc(&point_cloud, XSIZE*YSIZE);
int n_cols = 1;
int n_rows = 1;
int n_points = 1;
float nodal_point_x = 1;
float nodal_point_y = 1;
float focal_length_x = 1;
float focal_length_y = 1;
const float *T = NULL;
hipMalloc(&T, XSIZE*YSIZE);
const float *R = NULL;
hipMalloc(&R, XSIZE*YSIZE);
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
convertPointCloudToDepthImage_kernel<<<gridBlock, threadBlock>>>(depth_image,point_cloud,n_cols,n_rows,n_points,nodal_point_x,nodal_point_y,focal_length_x,focal_length_y,T,R);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
convertPointCloudToDepthImage_kernel<<<gridBlock, threadBlock>>>(depth_image,point_cloud,n_cols,n_rows,n_points,nodal_point_x,nodal_point_y,focal_length_x,focal_length_y,T,R);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
convertPointCloudToDepthImage_kernel<<<gridBlock, threadBlock>>>(depth_image,point_cloud,n_cols,n_rows,n_points,nodal_point_x,nodal_point_y,focal_length_x,focal_length_y,T,R);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}