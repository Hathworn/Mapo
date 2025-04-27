#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "next_move_kernel_llm.cu"
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
    bool *mask = NULL;
hipMalloc(&mask, XSIZE*YSIZE);
int *rat_count = NULL;
hipMalloc(&rat_count, XSIZE*YSIZE);
int *healthy_rat_count = NULL;
hipMalloc(&healthy_rat_count, XSIZE*YSIZE);
int *exposed_rat_count = NULL;
hipMalloc(&exposed_rat_count, XSIZE*YSIZE);
int *infectious_rat_count = NULL;
hipMalloc(&infectious_rat_count, XSIZE*YSIZE);
double *node_weight = NULL;
hipMalloc(&node_weight, XSIZE*YSIZE);
double *sum_weight_result = NULL;
hipMalloc(&sum_weight_result, XSIZE*YSIZE);
int *neighbor = NULL;
hipMalloc(&neighbor, XSIZE*YSIZE);
int *neighbor_start = NULL;
hipMalloc(&neighbor_start, XSIZE*YSIZE);
int width = XSIZE;
int height = YSIZE;
double batch_fraction = 2;
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
next_move_kernel<<<gridBlock, threadBlock>>>(mask,rat_count,healthy_rat_count,exposed_rat_count,infectious_rat_count,node_weight,sum_weight_result,neighbor,neighbor_start,width,height,batch_fraction);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
next_move_kernel<<<gridBlock, threadBlock>>>(mask,rat_count,healthy_rat_count,exposed_rat_count,infectious_rat_count,node_weight,sum_weight_result,neighbor,neighbor_start,width,height,batch_fraction);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
next_move_kernel<<<gridBlock, threadBlock>>>(mask,rat_count,healthy_rat_count,exposed_rat_count,infectious_rat_count,node_weight,sum_weight_result,neighbor,neighbor_start,width,height,batch_fraction);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}