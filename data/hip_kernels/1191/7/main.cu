#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "instance_iou_cuda_kernel.cu"
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
    int64_t total_gt_instances = 1;
const int64_t __restrict__ *nInstance = NULL;
hipMalloc(&nInstance, XSIZE*YSIZE);
int nProposal = 1;
const int64_t __restrict__ *proposals_idx = NULL;
hipMalloc(&proposals_idx, XSIZE*YSIZE);
const int64_t __restrict__ *proposals_offset = NULL;
hipMalloc(&proposals_offset, XSIZE*YSIZE);
const int64_t __restrict__ *instance_labels = NULL;
hipMalloc(&instance_labels, XSIZE*YSIZE);
const int64_t __restrict__ *offset_num_gt_instances = NULL;
hipMalloc(&offset_num_gt_instances, XSIZE*YSIZE);
const int64_t __restrict__ *batch = NULL;
hipMalloc(&batch, XSIZE*YSIZE);
const int64_t __restrict__ *instance_pointnum = NULL;
hipMalloc(&instance_pointnum, XSIZE*YSIZE);
float *proposals_iou = NULL;
hipMalloc(&proposals_iou, XSIZE*YSIZE);
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
instance_iou_cuda_kernel<<<gridBlock, threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
instance_iou_cuda_kernel<<<gridBlock, threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
instance_iou_cuda_kernel<<<gridBlock, threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}