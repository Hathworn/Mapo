#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "stdp_kernel.cu"
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
    float *weight = NULL;
hipMalloc(&weight, XSIZE*YSIZE);
int weight_size_0 = XSIZE*YSIZE;
int weight_size_1 = XSIZE*YSIZE;
int weight_size_2 = XSIZE*YSIZE;
int weight_size_3 = XSIZE*YSIZE;
float *output_spike = NULL;
hipMalloc(&output_spike, XSIZE*YSIZE);
int output_spike_size_0 = XSIZE*YSIZE;
int output_spike_size_1 = XSIZE*YSIZE;
int output_spike_size_2 = XSIZE*YSIZE;
int output_spike_size_3 = XSIZE*YSIZE;
float *history = NULL;
hipMalloc(&history, XSIZE*YSIZE);
float *weight_update = NULL;
hipMalloc(&weight_update, XSIZE*YSIZE);
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
stdp_kernel<<<gridBlock, threadBlock>>>(weight,weight_size_0,weight_size_1,weight_size_2,weight_size_3,output_spike,output_spike_size_0,output_spike_size_1,output_spike_size_2,output_spike_size_3,history,weight_update);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
stdp_kernel<<<gridBlock, threadBlock>>>(weight,weight_size_0,weight_size_1,weight_size_2,weight_size_3,output_spike,output_spike_size_0,output_spike_size_1,output_spike_size_2,output_spike_size_3,history,weight_update);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
stdp_kernel<<<gridBlock, threadBlock>>>(weight,weight_size_0,weight_size_1,weight_size_2,weight_size_3,output_spike,output_spike_size_0,output_spike_size_1,output_spike_size_2,output_spike_size_3,history,weight_update);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}