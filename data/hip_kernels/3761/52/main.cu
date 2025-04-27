#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "GetSpikes.cu"
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
    double *spike_array = NULL;
hipMalloc(&spike_array, XSIZE*YSIZE);
int array_size = XSIZE*YSIZE;
int n_port = 1;
int n_var = 1;
float *port_weight_arr = NULL;
hipMalloc(&port_weight_arr, XSIZE*YSIZE);
int port_weight_arr_step = 1;
int port_weight_port_step = 1;
float *port_input_arr = NULL;
hipMalloc(&port_input_arr, XSIZE*YSIZE);
int port_input_arr_step = 1;
int port_input_port_step = 1;
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
GetSpikes<<<gridBlock, threadBlock>>>(spike_array,array_size,n_port,n_var,port_weight_arr,port_weight_arr_step,port_weight_port_step,port_input_arr,port_input_arr_step,port_input_port_step);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
GetSpikes<<<gridBlock, threadBlock>>>(spike_array,array_size,n_port,n_var,port_weight_arr,port_weight_arr_step,port_weight_port_step,port_input_arr,port_input_arr_step,port_input_port_step);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
GetSpikes<<<gridBlock, threadBlock>>>(spike_array,array_size,n_port,n_var,port_weight_arr,port_weight_arr_step,port_weight_port_step,port_input_arr,port_input_arr_step,port_input_port_step);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}