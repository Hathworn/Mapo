#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "masquelier_get_indices_to_apply_stdp_llm.cu"
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
    int *d_postsyns = NULL;
hipMalloc(&d_postsyns, XSIZE*YSIZE);
float *d_last_spike_time_of_each_neuron = NULL;
hipMalloc(&d_last_spike_time_of_each_neuron, XSIZE*YSIZE);
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
int *d_index_of_last_afferent_synapse_to_spike = NULL;
hipMalloc(&d_index_of_last_afferent_synapse_to_spike, XSIZE*YSIZE);
bool *d_isindexed_ltd_synapse_spike = NULL;
hipMalloc(&d_isindexed_ltd_synapse_spike, XSIZE*YSIZE);
int *d_index_of_first_synapse_spiked_after_postneuron = NULL;
hipMalloc(&d_index_of_first_synapse_spiked_after_postneuron, XSIZE*YSIZE);
float currtime = 1;
int *d_plastic_synapse_indices = NULL;
hipMalloc(&d_plastic_synapse_indices, XSIZE*YSIZE);
size_t total_number_of_plastic_synapses = 1;
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
masquelier_get_indices_to_apply_stdp<<<gridBlock, threadBlock>>>(d_postsyns,d_last_spike_time_of_each_neuron,d_time_of_last_spike_to_reach_synapse,d_index_of_last_afferent_synapse_to_spike,d_isindexed_ltd_synapse_spike,d_index_of_first_synapse_spiked_after_postneuron,currtime,d_plastic_synapse_indices,total_number_of_plastic_synapses);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
masquelier_get_indices_to_apply_stdp<<<gridBlock, threadBlock>>>(d_postsyns,d_last_spike_time_of_each_neuron,d_time_of_last_spike_to_reach_synapse,d_index_of_last_afferent_synapse_to_spike,d_isindexed_ltd_synapse_spike,d_index_of_first_synapse_spiked_after_postneuron,currtime,d_plastic_synapse_indices,total_number_of_plastic_synapses);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
masquelier_get_indices_to_apply_stdp<<<gridBlock, threadBlock>>>(d_postsyns,d_last_spike_time_of_each_neuron,d_time_of_last_spike_to_reach_synapse,d_index_of_last_afferent_synapse_to_spike,d_isindexed_ltd_synapse_spike,d_index_of_first_synapse_spiked_after_postneuron,currtime,d_plastic_synapse_indices,total_number_of_plastic_synapses);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}