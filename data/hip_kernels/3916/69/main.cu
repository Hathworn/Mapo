#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "filter_kernel.cu"
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
    const float *box_preds = NULL;
hipMalloc(&box_preds, XSIZE*YSIZE);
const float *cls_preds = NULL;
hipMalloc(&cls_preds, XSIZE*YSIZE);
const float *dir_preds = NULL;
hipMalloc(&dir_preds, XSIZE*YSIZE);
const int *anchor_mask = NULL;
hipMalloc(&anchor_mask, XSIZE*YSIZE);
const float *dev_anchors_px = NULL;
hipMalloc(&dev_anchors_px, XSIZE*YSIZE);
const float *dev_anchors_py = NULL;
hipMalloc(&dev_anchors_py, XSIZE*YSIZE);
const float *dev_anchors_pz = NULL;
hipMalloc(&dev_anchors_pz, XSIZE*YSIZE);
const float *dev_anchors_dx = NULL;
hipMalloc(&dev_anchors_dx, XSIZE*YSIZE);
const float *dev_anchors_dy = NULL;
hipMalloc(&dev_anchors_dy, XSIZE*YSIZE);
const float *dev_anchors_dz = NULL;
hipMalloc(&dev_anchors_dz, XSIZE*YSIZE);
const float *dev_anchors_ro = NULL;
hipMalloc(&dev_anchors_ro, XSIZE*YSIZE);
float *filtered_box = NULL;
hipMalloc(&filtered_box, XSIZE*YSIZE);
float *filtered_score = NULL;
hipMalloc(&filtered_score, XSIZE*YSIZE);
int *filtered_dir = NULL;
hipMalloc(&filtered_dir, XSIZE*YSIZE);
float *box_for_nms = NULL;
hipMalloc(&box_for_nms, XSIZE*YSIZE);
int *filter_count = NULL;
hipMalloc(&filter_count, XSIZE*YSIZE);
const float FLOAT_MIN = 1;
const float FLOAT_MAX = 1;
const float score_threshold = 1;
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
filter_kernel<<<gridBlock, threadBlock>>>(box_preds,cls_preds,dir_preds,anchor_mask,dev_anchors_px,dev_anchors_py,dev_anchors_pz,dev_anchors_dx,dev_anchors_dy,dev_anchors_dz,dev_anchors_ro,filtered_box,filtered_score,filtered_dir,box_for_nms,filter_count,FLOAT_MIN,FLOAT_MAX,score_threshold,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
filter_kernel<<<gridBlock, threadBlock>>>(box_preds,cls_preds,dir_preds,anchor_mask,dev_anchors_px,dev_anchors_py,dev_anchors_pz,dev_anchors_dx,dev_anchors_dy,dev_anchors_dz,dev_anchors_ro,filtered_box,filtered_score,filtered_dir,box_for_nms,filter_count,FLOAT_MIN,FLOAT_MAX,score_threshold,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
filter_kernel<<<gridBlock, threadBlock>>>(box_preds,cls_preds,dir_preds,anchor_mask,dev_anchors_px,dev_anchors_py,dev_anchors_pz,dev_anchors_dx,dev_anchors_dy,dev_anchors_dz,dev_anchors_ro,filtered_box,filtered_score,filtered_dir,box_for_nms,filter_count,FLOAT_MIN,FLOAT_MAX,score_threshold,NUM_BOX_CORNERS,NUM_OUTPUT_BOX_FEATURE);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}