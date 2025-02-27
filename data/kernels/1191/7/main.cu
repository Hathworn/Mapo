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
int blocks_[20][2] = {{8,8},{16,16},{24,24},{32,32},{1,64},{1,128},{1,192},{1,256},{1,320},{1,384},{1,448},{1,512},{1,576},{1,640},{1,704},{1,768},{1,832},{1,896},{1,960},{1,1024}};
int matrices_[7][2] = {{240,240},{496,496},{784,784},{1016,1016},{1232,1232},{1680,1680},{2024,2024}};
int main(int argc, char **argv) {
hipSetDevice(0);
char* p;int matrix_len=strtol(argv[1], &p, 10);
for(int matrix_looper=0;matrix_looper<matrix_len;matrix_looper++){
for(int block_looper=0;block_looper<20;block_looper++){
int XSIZE=matrices_[matrix_looper][0],YSIZE=matrices_[matrix_looper][1],BLOCKX=blocks_[block_looper][0],BLOCKY=blocks_[block_looper][1];
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
while(iXSIZE%BLOCKX!=0)
{
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0)
{
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
instance_iou_cuda_kernel<<<gridBlock,threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
instance_iou_cuda_kernel<<<gridBlock,threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
instance_iou_cuda_kernel<<<gridBlock,threadBlock>>>(total_gt_instances,nInstance,nProposal,proposals_idx,proposals_offset,instance_labels,offset_num_gt_instances,batch,instance_pointnum,proposals_iou);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}