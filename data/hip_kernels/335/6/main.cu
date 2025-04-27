#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "current_calculate_postsynaptic_current_injection_kernel.cu"
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
    float *d_synaptic_efficacies_or_weights = NULL;
hipMalloc(&d_synaptic_efficacies_or_weights, XSIZE*YSIZE);
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
int *d_postsynaptic_neuron_indices = NULL;
hipMalloc(&d_postsynaptic_neuron_indices, XSIZE*YSIZE);
float *d_neurons_current_injections = NULL;
hipMalloc(&d_neurons_current_injections, XSIZE*YSIZE);
float current_time_in_seconds = 1;
size_t total_number_of_synapses = 1;
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
current_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_postsynaptic_neuron_indices,d_neurons_current_injections,current_time_in_seconds,total_number_of_synapses);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
current_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_postsynaptic_neuron_indices,d_neurons_current_injections,current_time_in_seconds,total_number_of_synapses);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
current_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_postsynaptic_neuron_indices,d_neurons_current_injections,current_time_in_seconds,total_number_of_synapses);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}