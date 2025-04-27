#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "weight_update_llm.cu"
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
    int *postsyn_neuron = NULL;
hipMalloc(&postsyn_neuron, XSIZE*YSIZE);
bool *neuron_in_plasticity_set = NULL;
hipMalloc(&neuron_in_plasticity_set, XSIZE*YSIZE);
float *current_weight = NULL;
hipMalloc(&current_weight, XSIZE*YSIZE);
float *weight_divisor = NULL;
hipMalloc(&weight_divisor, XSIZE*YSIZE);
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
weight_update<<<gridBlock, threadBlock>>>(postsyn_neuron,neuron_in_plasticity_set,current_weight,weight_divisor,d_plastic_synapse_indices,total_number_of_plastic_synapses);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
weight_update<<<gridBlock, threadBlock>>>(postsyn_neuron,neuron_in_plasticity_set,current_weight,weight_divisor,d_plastic_synapse_indices,total_number_of_plastic_synapses);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
weight_update<<<gridBlock, threadBlock>>>(postsyn_neuron,neuron_in_plasticity_set,current_weight,weight_divisor,d_plastic_synapse_indices,total_number_of_plastic_synapses);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}