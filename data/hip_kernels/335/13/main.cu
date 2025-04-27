#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_presynaptic_activities_C_kernel.cu"
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
float *d_time_of_last_spike_to_reach_synapse = NULL;
hipMalloc(&d_time_of_last_spike_to_reach_synapse, XSIZE*YSIZE);
bool *d_stdp = NULL;
hipMalloc(&d_stdp, XSIZE*YSIZE);
float timestep = 1;
float current_time_in_seconds = 1;
size_t total_number_of_synapses = 1;
float synaptic_neurotransmitter_concentration_alpha_C = 2;
float decay_term_tau_C = 1;
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
update_presynaptic_activities_C_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_time_of_last_spike_to_reach_synapse,d_stdp,timestep,current_time_in_seconds,total_number_of_synapses,synaptic_neurotransmitter_concentration_alpha_C,decay_term_tau_C);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_presynaptic_activities_C_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_time_of_last_spike_to_reach_synapse,d_stdp,timestep,current_time_in_seconds,total_number_of_synapses,synaptic_neurotransmitter_concentration_alpha_C,decay_term_tau_C);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_presynaptic_activities_C_kernel<<<gridBlock, threadBlock>>>(d_recent_presynaptic_activities_C,d_time_of_last_spike_to_reach_synapse,d_stdp,timestep,current_time_in_seconds,total_number_of_synapses,synaptic_neurotransmitter_concentration_alpha_C,decay_term_tau_C);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}