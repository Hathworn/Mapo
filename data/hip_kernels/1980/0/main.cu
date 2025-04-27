#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "DeformablePSROIPoolForwardKernel.cu"
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
    const int count = 1;
const double *bottom_data = NULL;
hipMalloc(&bottom_data, XSIZE*YSIZE);
const double spatial_scale = 1;
const int channels = 1;
const int height = 1;
const int width = 1;
const int pooled_height = 1;
const int pooled_width = 1;
const double *bottom_rois = NULL;
hipMalloc(&bottom_rois, XSIZE*YSIZE);
const double *bottom_trans = NULL;
hipMalloc(&bottom_trans, XSIZE*YSIZE);
const int no_trans = 1;
const double trans_std = 1;
const int sample_per_part = 1;
const int output_dim = 1;
const int group_size = 1;
const int part_size = 1;
const int num_classes = 1;
const int channels_each_class = 1;
double *top_data = NULL;
hipMalloc(&top_data, XSIZE*YSIZE);
double *top_count = NULL;
hipMalloc(&top_count, XSIZE*YSIZE);
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
DeformablePSROIPoolForwardKernel<<<gridBlock, threadBlock>>>(count,bottom_data,spatial_scale,channels,height,width,pooled_height,pooled_width,bottom_rois,bottom_trans,no_trans,trans_std,sample_per_part,output_dim,group_size,part_size,num_classes,channels_each_class,top_data,top_count);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
DeformablePSROIPoolForwardKernel<<<gridBlock, threadBlock>>>(count,bottom_data,spatial_scale,channels,height,width,pooled_height,pooled_width,bottom_rois,bottom_trans,no_trans,trans_std,sample_per_part,output_dim,group_size,part_size,num_classes,channels_each_class,top_data,top_count);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
DeformablePSROIPoolForwardKernel<<<gridBlock, threadBlock>>>(count,bottom_data,spatial_scale,channels,height,width,pooled_height,pooled_width,bottom_rois,bottom_trans,no_trans,trans_std,sample_per_part,output_dim,group_size,part_size,num_classes,channels_each_class,top_data,top_count);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}