#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "make_pillar_index_kernel_llm.cu"
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
    int *dev_pillar_count_histo = NULL;
hipMalloc(&dev_pillar_count_histo, XSIZE*YSIZE);
int *dev_counter = NULL;
hipMalloc(&dev_counter, XSIZE*YSIZE);
int *dev_pillar_count = NULL;
hipMalloc(&dev_pillar_count, XSIZE*YSIZE);
int *dev_x_coors = NULL;
hipMalloc(&dev_x_coors, XSIZE*YSIZE);
int *dev_y_coors = NULL;
hipMalloc(&dev_y_coors, XSIZE*YSIZE);
float *dev_x_coors_for_sub = NULL;
hipMalloc(&dev_x_coors_for_sub, XSIZE*YSIZE);
float *dev_y_coors_for_sub = NULL;
hipMalloc(&dev_y_coors_for_sub, XSIZE*YSIZE);
float *dev_num_points_per_pillar = NULL;
hipMalloc(&dev_num_points_per_pillar, XSIZE*YSIZE);
int *dev_sparse_pillar_map = NULL;
hipMalloc(&dev_sparse_pillar_map, XSIZE*YSIZE);
const int max_pillars = 1;
const int max_points_per_pillar = 1;
const int GRID_X_SIZE = 1;
const float PILLAR_X_SIZE = 1;
const float PILLAR_Y_SIZE = 1;
const int NUM_INDS_FOR_SCAN = 1;
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
make_pillar_index_kernel<<<gridBlock, threadBlock>>>(dev_pillar_count_histo,dev_counter,dev_pillar_count,dev_x_coors,dev_y_coors,dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_sparse_pillar_map,max_pillars,max_points_per_pillar,GRID_X_SIZE,PILLAR_X_SIZE,PILLAR_Y_SIZE,NUM_INDS_FOR_SCAN);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
make_pillar_index_kernel<<<gridBlock, threadBlock>>>(dev_pillar_count_histo,dev_counter,dev_pillar_count,dev_x_coors,dev_y_coors,dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_sparse_pillar_map,max_pillars,max_points_per_pillar,GRID_X_SIZE,PILLAR_X_SIZE,PILLAR_Y_SIZE,NUM_INDS_FOR_SCAN);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
make_pillar_index_kernel<<<gridBlock, threadBlock>>>(dev_pillar_count_histo,dev_counter,dev_pillar_count,dev_x_coors,dev_y_coors,dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_sparse_pillar_map,max_pillars,max_points_per_pillar,GRID_X_SIZE,PILLAR_X_SIZE,PILLAR_Y_SIZE,NUM_INDS_FOR_SCAN);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}