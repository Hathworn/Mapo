#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "make_pillar_histo_kernel_llm.cu"
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
    const float *dev_points = NULL;
hipMalloc(&dev_points, XSIZE*YSIZE);
float *dev_pillar_x_in_coors = NULL;
hipMalloc(&dev_pillar_x_in_coors, XSIZE*YSIZE);
float *dev_pillar_y_in_coors = NULL;
hipMalloc(&dev_pillar_y_in_coors, XSIZE*YSIZE);
float *dev_pillar_z_in_coors = NULL;
hipMalloc(&dev_pillar_z_in_coors, XSIZE*YSIZE);
float *dev_pillar_i_in_coors = NULL;
hipMalloc(&dev_pillar_i_in_coors, XSIZE*YSIZE);
int *pillar_count_histo = NULL;
hipMalloc(&pillar_count_histo, XSIZE*YSIZE);
const int num_points = 1;
const int max_points_per_pillar = 1;
const int GRID_X_SIZE = 1;
const int GRID_Y_SIZE = 1;
const int GRID_Z_SIZE = 1;
const float MIN_X_RANGE = 1;
const float MIN_Y_RANGE = 1;
const float MIN_Z_RANGE = 1;
const float PILLAR_X_SIZE = 1;
const float PILLAR_Y_SIZE = 1;
const float PILLAR_Z_SIZE = 1;
const int NUM_BOX_CORNERS = 1;
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
make_pillar_histo_kernel<<<gridBlock, threadBlock>>>(dev_points,dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,pillar_count_histo,num_points,max_points_per_pillar,GRID_X_SIZE,GRID_Y_SIZE,GRID_Z_SIZE,MIN_X_RANGE,MIN_Y_RANGE,MIN_Z_RANGE,PILLAR_X_SIZE,PILLAR_Y_SIZE,PILLAR_Z_SIZE,NUM_BOX_CORNERS);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
make_pillar_histo_kernel<<<gridBlock, threadBlock>>>(dev_points,dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,pillar_count_histo,num_points,max_points_per_pillar,GRID_X_SIZE,GRID_Y_SIZE,GRID_Z_SIZE,MIN_X_RANGE,MIN_Y_RANGE,MIN_Z_RANGE,PILLAR_X_SIZE,PILLAR_Y_SIZE,PILLAR_Z_SIZE,NUM_BOX_CORNERS);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
make_pillar_histo_kernel<<<gridBlock, threadBlock>>>(dev_points,dev_pillar_x_in_coors,dev_pillar_y_in_coors,dev_pillar_z_in_coors,dev_pillar_i_in_coors,pillar_count_histo,num_points,max_points_per_pillar,GRID_X_SIZE,GRID_Y_SIZE,GRID_Z_SIZE,MIN_X_RANGE,MIN_Y_RANGE,MIN_Z_RANGE,PILLAR_X_SIZE,PILLAR_Y_SIZE,PILLAR_Z_SIZE,NUM_BOX_CORNERS);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}