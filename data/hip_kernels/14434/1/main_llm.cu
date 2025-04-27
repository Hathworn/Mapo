#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuda_neural_net_llm.cu"
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
    float *Weights_D = NULL;
hipMalloc(&Weights_D, XSIZE*YSIZE);
int num_per_sweeper = 1;
int num_per_layer = 1;
int num_per_input = 1;
int num_per_output = 1;
int num_weights = 1;
int num_layers = 1;
float response = 1;
float *inputs_d = NULL;
hipMalloc(&inputs_d, XSIZE*YSIZE);
float *outputs_d = NULL;
hipMalloc(&outputs_d, XSIZE*YSIZE);
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
cuda_neural_net<<<gridBlock, threadBlock>>>(Weights_D,num_per_sweeper,num_per_layer,num_per_input,num_per_output,num_weights,num_layers,response,inputs_d,outputs_d);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuda_neural_net<<<gridBlock, threadBlock>>>(Weights_D,num_per_sweeper,num_per_layer,num_per_input,num_per_output,num_weights,num_layers,response,inputs_d,outputs_d);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuda_neural_net<<<gridBlock, threadBlock>>>(Weights_D,num_per_sweeper,num_per_layer,num_per_input,num_per_output,num_weights,num_layers,response,inputs_d,outputs_d);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}