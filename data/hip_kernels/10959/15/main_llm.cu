#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "updateGradInputMV_llm.cu"
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
    const float *score = NULL;
hipMalloc(&score, XSIZE*YSIZE);
const float *weight = NULL;
hipMalloc(&weight, XSIZE*YSIZE);
const float *mapping = NULL;
hipMalloc(&mapping, XSIZE*YSIZE);
const float *n_class_in_cluster = NULL;
hipMalloc(&n_class_in_cluster, XSIZE*YSIZE);
const float *class_start_indices = NULL;
hipMalloc(&class_start_indices, XSIZE*YSIZE);
const float *target = NULL;
hipMalloc(&target, XSIZE*YSIZE);
const long gradInput_stride0 = 1;
const long weight_stride0 = 1;
const long score_stride0 = 1;
int input_size = XSIZE*YSIZE;
float *gradInput = NULL;
hipMalloc(&gradInput, XSIZE*YSIZE);
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
updateGradInputMV<<<gridBlock, threadBlock>>>(score,weight,mapping,n_class_in_cluster,class_start_indices,target,gradInput_stride0,weight_stride0,score_stride0,input_size,gradInput);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
updateGradInputMV<<<gridBlock, threadBlock>>>(score,weight,mapping,n_class_in_cluster,class_start_indices,target,gradInput_stride0,weight_stride0,score_stride0,input_size,gradInput);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
updateGradInputMV<<<gridBlock, threadBlock>>>(score,weight,mapping,n_class_in_cluster,class_start_indices,target,gradInput_stride0,weight_stride0,score_stride0,input_size,gradInput);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}