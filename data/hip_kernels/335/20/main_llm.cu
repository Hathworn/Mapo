#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "poisson_update_membrane_potentials_kernel_llm.cu"
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
    curandState_t *d_states = NULL;
hipMalloc(&d_states, XSIZE*YSIZE);
float *d_rates = NULL;
hipMalloc(&d_rates, XSIZE*YSIZE);
float *d_membrane_potentials_v = NULL;
hipMalloc(&d_membrane_potentials_v, XSIZE*YSIZE);
float timestep = 1;
float *d_thresholds_for_action_potential_spikes = NULL;
hipMalloc(&d_thresholds_for_action_potential_spikes, XSIZE*YSIZE);
size_t total_number_of_input_neurons = 1;
int current_stimulus_index = 1;
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
poisson_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_states,d_rates,d_membrane_potentials_v,timestep,d_thresholds_for_action_potential_spikes,total_number_of_input_neurons,current_stimulus_index);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
poisson_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_states,d_rates,d_membrane_potentials_v,timestep,d_thresholds_for_action_potential_spikes,total_number_of_input_neurons,current_stimulus_index);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
poisson_update_membrane_potentials_kernel<<<gridBlock, threadBlock>>>(d_states,d_rates,d_membrane_potentials_v,timestep,d_thresholds_for_action_potential_spikes,total_number_of_input_neurons,current_stimulus_index);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}