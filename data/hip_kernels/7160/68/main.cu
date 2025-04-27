#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "make_extra_network_input_kernel.cu"
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
    float *dev_x_coors_for_sub = NULL;
hipMalloc(&dev_x_coors_for_sub, XSIZE*YSIZE);
float *dev_y_coors_for_sub = NULL;
hipMalloc(&dev_y_coors_for_sub, XSIZE*YSIZE);
float *dev_num_points_per_pillar = NULL;
hipMalloc(&dev_num_points_per_pillar, XSIZE*YSIZE);
float *dev_x_coors_for_sub_shaped = NULL;
hipMalloc(&dev_x_coors_for_sub_shaped, XSIZE*YSIZE);
float *dev_y_coors_for_sub_shaped = NULL;
hipMalloc(&dev_y_coors_for_sub_shaped, XSIZE*YSIZE);
float *dev_pillar_feature_mask = NULL;
hipMalloc(&dev_pillar_feature_mask, XSIZE*YSIZE);
const int MAX_NUM_POINTS_PER_PILLAR = 1;
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
make_extra_network_input_kernel<<<gridBlock, threadBlock>>>(dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_x_coors_for_sub_shaped,dev_y_coors_for_sub_shaped,dev_pillar_feature_mask,MAX_NUM_POINTS_PER_PILLAR);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
make_extra_network_input_kernel<<<gridBlock, threadBlock>>>(dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_x_coors_for_sub_shaped,dev_y_coors_for_sub_shaped,dev_pillar_feature_mask,MAX_NUM_POINTS_PER_PILLAR);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
make_extra_network_input_kernel<<<gridBlock, threadBlock>>>(dev_x_coors_for_sub,dev_y_coors_for_sub,dev_num_points_per_pillar,dev_x_coors_for_sub_shaped,dev_y_coors_for_sub_shaped,dev_pillar_feature_mask,MAX_NUM_POINTS_PER_PILLAR);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}