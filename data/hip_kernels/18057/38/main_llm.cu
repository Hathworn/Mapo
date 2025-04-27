#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "getMaxPorb_llm.cu"
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
    const int size = 1;
const float *class_prob = NULL;
hipMalloc(&class_prob, XSIZE*YSIZE);
const int class_num = 1;
float *max_prob = NULL;
hipMalloc(&max_prob, XSIZE*YSIZE);
int *idx = NULL;
hipMalloc(&idx, XSIZE*YSIZE);
int *class_idx = NULL;
hipMalloc(&class_idx, XSIZE*YSIZE);
const int conf_thresh = 1;
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
getMaxPorb<<<gridBlock, threadBlock>>>(size,class_prob,class_num,max_prob,idx,class_idx,conf_thresh);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
getMaxPorb<<<gridBlock, threadBlock>>>(size,class_prob,class_num,max_prob,idx,class_idx,conf_thresh);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
getMaxPorb<<<gridBlock, threadBlock>>>(size,class_prob,class_num,max_prob,idx,class_idx,conf_thresh);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}