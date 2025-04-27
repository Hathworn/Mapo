#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "conductance_move_spikes_towards_synapses_kernel.cu"
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
    int *d_spikes_travelling_to_synapse = NULL;
hipMalloc(&d_spikes_travelling_to_synapse, XSIZE*YSIZE);
float current_time_in_seconds = 1;
int *circular_spikenum_buffer = NULL;
hipMalloc(&circular_spikenum_buffer, XSIZE*YSIZE);
int *spikeid_buffer = NULL;
hipMalloc(&spikeid_buffer, XSIZE*YSIZE);
int bufferloc = 1;
int buffersize = XSIZE*YSIZE;
int total_number_of_synapses = 1;
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
int *postsynaptic_neuron_indices = NULL;
hipMalloc(&postsynaptic_neuron_indices, XSIZE*YSIZE);
float *neuron_wise_conductance_trace = NULL;
hipMalloc(&neuron_wise_conductance_trace, XSIZE*YSIZE);
int *synaptic_decay_id = NULL;
hipMalloc(&synaptic_decay_id, XSIZE*YSIZE);
int total_number_of_neurons = 1;
float *d_synaptic_efficacies_or_weights = NULL;
hipMalloc(&d_synaptic_efficacies_or_weights, XSIZE*YSIZE);
float *d_biological_conductance_scaling_constants_lambda = NULL;
hipMalloc(&d_biological_conductance_scaling_constants_lambda, XSIZE*YSIZE);
float timestep = 1;
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
conductance_move_spikes_towards_synapses_kernel<<<gridBlock, threadBlock>>>(d_spikes_travelling_to_synapse,current_time_in_seconds,circular_spikenum_buffer,spikeid_buffer,bufferloc,buffersize,total_number_of_synapses,d_time_of_last_spike_to_reach_synapse,postsynaptic_neuron_indices,neuron_wise_conductance_trace,synaptic_decay_id,total_number_of_neurons,d_synaptic_efficacies_or_weights,d_biological_conductance_scaling_constants_lambda,timestep);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
conductance_move_spikes_towards_synapses_kernel<<<gridBlock, threadBlock>>>(d_spikes_travelling_to_synapse,current_time_in_seconds,circular_spikenum_buffer,spikeid_buffer,bufferloc,buffersize,total_number_of_synapses,d_time_of_last_spike_to_reach_synapse,postsynaptic_neuron_indices,neuron_wise_conductance_trace,synaptic_decay_id,total_number_of_neurons,d_synaptic_efficacies_or_weights,d_biological_conductance_scaling_constants_lambda,timestep);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
conductance_move_spikes_towards_synapses_kernel<<<gridBlock, threadBlock>>>(d_spikes_travelling_to_synapse,current_time_in_seconds,circular_spikenum_buffer,spikeid_buffer,bufferloc,buffersize,total_number_of_synapses,d_time_of_last_spike_to_reach_synapse,postsynaptic_neuron_indices,neuron_wise_conductance_trace,synaptic_decay_id,total_number_of_neurons,d_synaptic_efficacies_or_weights,d_biological_conductance_scaling_constants_lambda,timestep);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}