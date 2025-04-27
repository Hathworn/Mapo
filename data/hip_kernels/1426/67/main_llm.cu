#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "make_pillar_feature_kernel_llm.cu"
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
    float *dev_pillar_x_in_coors = NULL;
hipMalloc(&dev_pillar_x_in_coors, XSIZE*YSIZE);
float *dev_pillar_y_in_coors = NULL;
hipMalloc(&dev_pillar_y_in_coors, XSIZE*YSIZE);
float *dev_pillar_z_in_coors = NULL;
hipMalloc(&dev_pillar_z_in_coors, XSIZE*YSIZE);
float *dev_pillar_i_in_coors = NULL;
hipMalloc(&dev_pillar_i_in_coors, XSIZE*YSIZE);
float *dev_pillar_x = NULL;
hipMalloc(&dev_pillar_x, XSIZE*YSIZE);
float *dev_pillar_y = NULL;
hipMalloc(&dev_pillar_y, XSIZE*YSIZE);
float *dev_pillar_z = NULL;
hipMalloc(&dev_pillar_z, XSIZE*YSIZE);
float *dev_pillar_i = NULL;
hipMalloc(&dev_pillar_i, XSIZE*YSIZE);
int *dev_x_coors = NULL;
hipMalloc(&dev_x_coors, XSIZE*YSIZE);
int *dev_y_coors = NULL;
hipMalloc(&dev_y_coors, XSIZE*YSIZE);
float *dev_num_points_per_pillar = NULL;
hipMalloc(&dev_num_points_per_pillar, XSIZE*YSIZE);
const int max_points = 1;
const int GRID_X_SIZE = 1;
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
make_pillar_feature_kernel<<<gridBlock, threadBlock>>>(dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,dev_pillar_x,dev_pillar_y,dev_pillar_z,dev_pillar_i,dev_x_coors,dev_y_coors,dev_num_points_per_pillar,max_points,GRID_X_SIZE);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
make_pillar_feature_kernel<<<gridBlock, threadBlock>>>(dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,dev_pillar_x,dev_pillar_y,dev_pillar_z,dev_pillar_i,dev_x_coors,dev_y_coors,dev_num_points_per_pillar,max_points,GRID_X_SIZE);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
make_pillar_feature_kernel<<<gridBlock, threadBlock>>>(dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,dev_pillar_x,dev_pillar_y,dev_pillar_z,dev_pillar_i,dev_x_coors,dev_y_coors,dev_num_points_per_pillar,max_points,GRID_X_SIZE);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}