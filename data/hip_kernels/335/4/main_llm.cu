#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "conductance_calculate_postsynaptic_current_injection_kernel_llm.cu"
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
    int *d_presynaptic_neuron_indices = NULL;
hipMalloc(&d_presynaptic_neuron_indices, XSIZE*YSIZE);
int *d_postsynaptic_neuron_indices = NULL;
hipMalloc(&d_postsynaptic_neuron_indices, XSIZE*YSIZE);
float *d_reversal_potentials_Vhat = NULL;
hipMalloc(&d_reversal_potentials_Vhat, XSIZE*YSIZE);
float *d_neurons_current_injections = NULL;
hipMalloc(&d_neurons_current_injections, XSIZE*YSIZE);
size_t total_number_of_synapses = 1;
float *d_membrane_potentials_v = NULL;
hipMalloc(&d_membrane_potentials_v, XSIZE*YSIZE);
float *d_synaptic_conductances_g = NULL;
hipMalloc(&d_synaptic_conductances_g, XSIZE*YSIZE);
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
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_presynaptic_neuron_indices,d_postsynaptic_neuron_indices,d_reversal_potentials_Vhat,d_neurons_current_injections,total_number_of_synapses,d_membrane_potentials_v,d_synaptic_conductances_g);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_presynaptic_neuron_indices,d_postsynaptic_neuron_indices,d_reversal_potentials_Vhat,d_neurons_current_injections,total_number_of_synapses,d_membrane_potentials_v,d_synaptic_conductances_g);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
conductance_calculate_postsynaptic_current_injection_kernel<<<gridBlock, threadBlock>>>(d_presynaptic_neuron_indices,d_postsynaptic_neuron_indices,d_reversal_potentials_Vhat,d_neurons_current_injections,total_number_of_synapses,d_membrane_potentials_v,d_synaptic_conductances_g);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}