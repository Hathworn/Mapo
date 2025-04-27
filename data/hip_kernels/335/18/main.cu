#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "reset_states_u_after_spikes_kernel.cu"
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
    float *d_states_u = NULL;
hipMalloc(&d_states_u, XSIZE*YSIZE);
float *d_param_d = NULL;
hipMalloc(&d_param_d, XSIZE*YSIZE);
float *d_last_spike_time_of_each_neuron = NULL;
hipMalloc(&d_last_spike_time_of_each_neuron, XSIZE*YSIZE);
float current_time_in_seconds = 1;
size_t total_number_of_neurons = 1;
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
reset_states_u_after_spikes_kernel<<<gridBlock, threadBlock>>>(d_states_u,d_param_d,d_last_spike_time_of_each_neuron,current_time_in_seconds,total_number_of_neurons);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
reset_states_u_after_spikes_kernel<<<gridBlock, threadBlock>>>(d_states_u,d_param_d,d_last_spike_time_of_each_neuron,current_time_in_seconds,total_number_of_neurons);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
reset_states_u_after_spikes_kernel<<<gridBlock, threadBlock>>>(d_states_u,d_param_d,d_last_spike_time_of_each_neuron,current_time_in_seconds,total_number_of_neurons);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}