#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cudaS_ssdToOutput_kernels.cu"
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
    unsigned int batchSize = 1;
unsigned int nbClass = 1;
unsigned int nbAnchors = 1;
unsigned int channelWidth = 1;
unsigned int channelHeight = 1;
unsigned int nbProposals = 1;
unsigned int *nbValidROIs = NULL;
hipMalloc(&nbValidROIs, XSIZE*YSIZE);
unsigned int cls = 1;
unsigned int totalParts = 1;
unsigned int totalTemplates = 1;
unsigned int maxParts = 1;
unsigned int maxTemplates = 1;
unsigned int cumulParts = 1;
unsigned int cumulTemplates = 1;
unsigned int nbParts = 1;
unsigned int nbTemplates = 1;
float xRatio = 1;
float yRatio = 1;
float xOutputRatio = 1;
float yOutputRatio = 1;
const float *roi_bbox = NULL;
hipMalloc(&roi_bbox, XSIZE*YSIZE);
const float *roi_anchors = NULL;
hipMalloc(&roi_anchors, XSIZE*YSIZE);
const float *anchors = NULL;
hipMalloc(&anchors, XSIZE*YSIZE);
const float *inputs_parts = NULL;
hipMalloc(&inputs_parts, XSIZE*YSIZE);
const float *inputs_templates = NULL;
hipMalloc(&inputs_templates, XSIZE*YSIZE);
float *outputs = NULL;
hipMalloc(&outputs, XSIZE*YSIZE);
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
cudaS_ssdToOutput_kernels<<<gridBlock, threadBlock>>>(batchSize,nbClass,nbAnchors,channelWidth,channelHeight,nbProposals,nbValidROIs,cls,totalParts,totalTemplates,maxParts,maxTemplates,cumulParts,cumulTemplates,nbParts,nbTemplates,xRatio,yRatio,xOutputRatio,yOutputRatio,roi_bbox,roi_anchors,anchors,inputs_parts,inputs_templates,outputs);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cudaS_ssdToOutput_kernels<<<gridBlock, threadBlock>>>(batchSize,nbClass,nbAnchors,channelWidth,channelHeight,nbProposals,nbValidROIs,cls,totalParts,totalTemplates,maxParts,maxTemplates,cumulParts,cumulTemplates,nbParts,nbTemplates,xRatio,yRatio,xOutputRatio,yOutputRatio,roi_bbox,roi_anchors,anchors,inputs_parts,inputs_templates,outputs);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cudaS_ssdToOutput_kernels<<<gridBlock, threadBlock>>>(batchSize,nbClass,nbAnchors,channelWidth,channelHeight,nbProposals,nbValidROIs,cls,totalParts,totalTemplates,maxParts,maxTemplates,cumulParts,cumulTemplates,nbParts,nbTemplates,xRatio,yRatio,xOutputRatio,yOutputRatio,roi_bbox,roi_anchors,anchors,inputs_parts,inputs_templates,outputs);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}