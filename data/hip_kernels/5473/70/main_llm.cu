#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "sort_boxes_by_indexes_kernel_llm.cu"
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
    float *filtered_box = NULL;
hipMalloc(&filtered_box, XSIZE*YSIZE);
int *filtered_dir = NULL;
hipMalloc(&filtered_dir, XSIZE*YSIZE);
float *box_for_nms = NULL;
hipMalloc(&box_for_nms, XSIZE*YSIZE);
int *indexes = NULL;
hipMalloc(&indexes, XSIZE*YSIZE);
int filter_count = 2;
float *sorted_filtered_boxes = NULL;
hipMalloc(&sorted_filtered_boxes, XSIZE*YSIZE);
int *sorted_filtered_dir = NULL;
hipMalloc(&sorted_filtered_dir, XSIZE*YSIZE);
float *sorted_box_for_nms = NULL;
hipMalloc(&sorted_box_for_nms, XSIZE*YSIZE);
const int NUM_BOX_CORNERS = 1;
const int NUM_OUTPUT_BOX_FEATURE = 1;
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
sort_boxes_by_indexes_kernel<<<gridBlock, threadBlock>>>(filtered_box,filtered_dir,box_for_nms,indexes,filter_count,sorted_filtered_boxes,sorted_filtered_dir,sorted_box_for_nms,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
sort_boxes_by_indexes_kernel<<<gridBlock, threadBlock>>>(filtered_box,filtered_dir,box_for_nms,indexes,filter_count,sorted_filtered_boxes,sorted_filtered_dir,sorted_box_for_nms,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
sort_boxes_by_indexes_kernel<<<gridBlock, threadBlock>>>(filtered_box,filtered_dir,box_for_nms,indexes,filter_count,sorted_filtered_boxes,sorted_filtered_dir,sorted_box_for_nms,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}