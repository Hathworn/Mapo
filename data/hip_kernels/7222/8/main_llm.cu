#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "back_llm.cu"
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
    double *h_out_d = NULL;
hipMalloc(&h_out_d, XSIZE*YSIZE);
double *weights_out_d = NULL;
hipMalloc(&weights_out_d, XSIZE*YSIZE);
double *weights_h_d = NULL;
hipMalloc(&weights_h_d, XSIZE*YSIZE);
double *weights_in_d = NULL;
hipMalloc(&weights_in_d, XSIZE*YSIZE);
double *outputs_d = NULL;
hipMalloc(&outputs_d, XSIZE*YSIZE);
double *deltas_h_d = NULL;
hipMalloc(&deltas_h_d, XSIZE*YSIZE);
double *deltas_h_new_d = NULL;
hipMalloc(&deltas_h_new_d, XSIZE*YSIZE);
double *deltas_o_d = NULL;
hipMalloc(&deltas_o_d, XSIZE*YSIZE);
double *weights_in_delta_d = NULL;
hipMalloc(&weights_in_delta_d, XSIZE*YSIZE);
double *weights_out_delta_d = NULL;
hipMalloc(&weights_out_delta_d, XSIZE*YSIZE);
double *weights_h_delta_d = NULL;
hipMalloc(&weights_h_delta_d, XSIZE*YSIZE);
int height = YSIZE;
int inputs = 1;
int outputs = 1;
int layers = 1;
double *training_in_d = NULL;
hipMalloc(&training_in_d, XSIZE*YSIZE);
double *training_out_d = NULL;
hipMalloc(&training_out_d, XSIZE*YSIZE);
int sample = 1;
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
back<<<gridBlock, threadBlock>>>(h_out_d,weights_out_d,weights_h_d,weights_in_d,outputs_d,deltas_h_d,deltas_h_new_d,deltas_o_d,weights_in_delta_d,weights_out_delta_d,weights_h_delta_d,height,inputs,outputs,layers,training_in_d,training_out_d,sample);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
back<<<gridBlock, threadBlock>>>(h_out_d,weights_out_d,weights_h_d,weights_in_d,outputs_d,deltas_h_d,deltas_h_new_d,deltas_o_d,weights_in_delta_d,weights_out_delta_d,weights_h_delta_d,height,inputs,outputs,layers,training_in_d,training_out_d,sample);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
back<<<gridBlock, threadBlock>>>(h_out_d,weights_out_d,weights_h_d,weights_in_d,outputs_d,deltas_h_d,deltas_h_new_d,deltas_o_d,weights_in_delta_d,weights_out_delta_d,weights_h_delta_d,height,inputs,outputs,layers,training_in_d,training_out_d,sample);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}