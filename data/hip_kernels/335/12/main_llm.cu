#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "update_postsynaptic_activities_kernel_llm.cu"
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
size_t total_number_of_neurons = 1;
float *d_recent_postsynaptic_activities_D = NULL;
hipMalloc(&d_recent_postsynaptic_activities_D, XSIZE*YSIZE);
float *d_last_spike_time_of_each_neuron = NULL;
hipMalloc(&d_last_spike_time_of_each_neuron, XSIZE*YSIZE);
float current_time_in_seconds = 1;
float decay_term_tau_D = 1;
float model_parameter_alpha_D = 2;
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
update_postsynaptic_activities_kernel<<<gridBlock, threadBlock>>>(timestep,total_number_of_neurons,d_recent_postsynaptic_activities_D,d_last_spike_time_of_each_neuron,current_time_in_seconds,decay_term_tau_D,model_parameter_alpha_D);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
update_postsynaptic_activities_kernel<<<gridBlock, threadBlock>>>(timestep,total_number_of_neurons,d_recent_postsynaptic_activities_D,d_last_spike_time_of_each_neuron,current_time_in_seconds,decay_term_tau_D,model_parameter_alpha_D);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
update_postsynaptic_activities_kernel<<<gridBlock, threadBlock>>>(timestep,total_number_of_neurons,d_recent_postsynaptic_activities_D,d_last_spike_time_of_each_neuron,current_time_in_seconds,decay_term_tau_D,model_parameter_alpha_D);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}