#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "conductance_calculate_postsynaptic_current_injection_kernel.cu"
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
    float *decay_term_values = NULL;
hipMalloc(&decay_term_values, XSIZE*YSIZE);
float *reversal_values = NULL;
hipMalloc(&reversal_values, XSIZE*YSIZE);
int num_decay_terms = 1;
int *synapse_decay_values = NULL;
hipMalloc(&synapse_decay_values, XSIZE*YSIZE);
float *neuron_wise_conductance_traces = NULL;
hipMalloc(&neuron_wise_conductance_traces, XSIZE*YSIZE);
float *d_neurons_current_injections = NULL;
hipMalloc(&d_neurons_current_injections, XSIZE*YSIZE);
float *d_membrane_potentials_v = NULL;
hipMalloc(&d_membrane_potentials_v, XSIZE*YSIZE);
float timestep = 1;
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
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(decay_term_values,reversal_values,num_decay_terms,synapse_decay_values,neuron_wise_conductance_traces,d_neurons_current_injections,d_membrane_potentials_v,timestep,total_number_of_neurons);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(decay_term_values,reversal_values,num_decay_terms,synapse_decay_values,neuron_wise_conductance_traces,d_neurons_current_injections,d_membrane_potentials_v,timestep,total_number_of_neurons);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(decay_term_values,reversal_values,num_decay_terms,synapse_decay_values,neuron_wise_conductance_traces,d_neurons_current_injections,d_membrane_potentials_v,timestep,total_number_of_neurons);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}