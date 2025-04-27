#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "check_for_neuron_spikes_kernel.cu"
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
    float *d_membrane_potentials_v = NULL;
hipMalloc(&d_membrane_potentials_v, XSIZE*YSIZE);
float *d_thresholds_for_action_potential_spikes = NULL;
hipMalloc(&d_thresholds_for_action_potential_spikes, XSIZE*YSIZE);
float *d_resting_potentials = NULL;
hipMalloc(&d_resting_potentials, XSIZE*YSIZE);
float *d_last_spike_time_of_each_neuron = NULL;
hipMalloc(&d_last_spike_time_of_each_neuron, XSIZE*YSIZE);
unsigned char *d_bitarray_of_neuron_spikes = NULL;
hipMalloc(&d_bitarray_of_neuron_spikes, XSIZE*YSIZE);
int bitarray_length = 1;
int bitarray_maximum_axonal_delay_in_timesteps = 1;
float current_time_in_seconds = 1;
float timestep = 1;
size_t total_number_of_neurons = 1;
bool high_fidelity_spike_flag = 1;
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
check_for_neuron_spikes_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_thresholds_for_action_potential_spikes,d_resting_potentials,d_last_spike_time_of_each_neuron,d_bitarray_of_neuron_spikes,bitarray_length,bitarray_maximum_axonal_delay_in_timesteps,current_time_in_seconds,timestep,total_number_of_neurons,high_fidelity_spike_flag);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
check_for_neuron_spikes_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_thresholds_for_action_potential_spikes,d_resting_potentials,d_last_spike_time_of_each_neuron,d_bitarray_of_neuron_spikes,bitarray_length,bitarray_maximum_axonal_delay_in_timesteps,current_time_in_seconds,timestep,total_number_of_neurons,high_fidelity_spike_flag);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
check_for_neuron_spikes_kernel<<<gridBlock, threadBlock>>>(d_membrane_potentials_v,d_thresholds_for_action_potential_spikes,d_resting_potentials,d_last_spike_time_of_each_neuron,d_bitarray_of_neuron_spikes,bitarray_length,bitarray_maximum_axonal_delay_in_timesteps,current_time_in_seconds,timestep,total_number_of_neurons,high_fidelity_spike_flag);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}