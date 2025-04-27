#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_synaptic_efficacies_or_weights_kernel_llm.cu"
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
    float *d_recent_presynaptic_activities_C = NULL;
hipMalloc(&d_recent_presynaptic_activities_C, XSIZE*YSIZE);
float *d_recent_postsynaptic_activities_D = NULL;
hipMalloc(&d_recent_postsynaptic_activities_D, XSIZE*YSIZE);
int *d_postsynaptic_neuron_indices = NULL;
hipMalloc(&d_postsynaptic_neuron_indices, XSIZE*YSIZE);
float *d_synaptic_efficacies_or_weights = NULL;
hipMalloc(&d_synaptic_efficacies_or_weights, XSIZE*YSIZE);
float current_time_in_seconds = 1;
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
float *d_last_spike_time_of_each_neuron = NULL;
hipMalloc(&d_last_spike_time_of_each_neuron, XSIZE*YSIZE);
bool *d_stdp = NULL;
hipMalloc(&d_stdp, XSIZE*YSIZE);
size_t total_number_of_synapses = 1;
float learning_rate_rho = 1;
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
update_synaptic_efficacies_or_weights_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_recent_postsynaptic_activities_D,d_postsynaptic_neuron_indices,d_synaptic_efficacies_or_weights,current_time_in_seconds,d_time_of_last_spike_to_reach_synapse,d_last_spike_time_of_each_neuron,d_stdp,total_number_of_synapses,learning_rate_rho);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_synaptic_efficacies_or_weights_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_recent_postsynaptic_activities_D,d_postsynaptic_neuron_indices,d_synaptic_efficacies_or_weights,current_time_in_seconds,d_time_of_last_spike_to_reach_synapse,d_last_spike_time_of_each_neuron,d_stdp,total_number_of_synapses,learning_rate_rho);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_synaptic_efficacies_or_weights_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_recent_postsynaptic_activities_D,d_postsynaptic_neuron_indices,d_synaptic_efficacies_or_weights,current_time_in_seconds,d_time_of_last_spike_to_reach_synapse,d_last_spike_time_of_each_neuron,d_stdp,total_number_of_synapses,learning_rate_rho);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}