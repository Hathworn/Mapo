#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "conductance_update_synaptic_conductances_kernel_llm.cu"
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
    float timestep = 1;
float *d_synaptic_conductances_g = NULL;
hipMalloc(&d_synaptic_conductances_g, XSIZE*YSIZE);
float *d_synaptic_efficacies_or_weights = NULL;
hipMalloc(&d_synaptic_efficacies_or_weights, XSIZE*YSIZE);
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
float *d_biological_conductance_scaling_constants_lambda = NULL;
hipMalloc(&d_biological_conductance_scaling_constants_lambda, XSIZE*YSIZE);
int total_number_of_synapses = 1;
float current_time_in_seconds = 1;
float *d_decay_terms_tau_g = NULL;
hipMalloc(&d_decay_terms_tau_g, XSIZE*YSIZE);
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
conductance_update_synaptic_conductances_kernel<<<gridBlock, threadBlock>>>(timestep,d_synaptic_conductances_g,d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_biological_conductance_scaling_constants_lambda,total_number_of_synapses,current_time_in_seconds,d_decay_terms_tau_g);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
conductance_update_synaptic_conductances_kernel<<<gridBlock, threadBlock>>>(timestep,d_synaptic_conductances_g,d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_biological_conductance_scaling_constants_lambda,total_number_of_synapses,current_time_in_seconds,d_decay_terms_tau_g);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
conductance_update_synaptic_conductances_kernel<<<gridBlock, threadBlock>>>(timestep,d_synaptic_conductances_g,d_synaptic_efficacies_or_weights,d_time_of_last_spike_to_reach_synapse,d_biological_conductance_scaling_constants_lambda,total_number_of_synapses,current_time_in_seconds,d_decay_terms_tau_g);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}