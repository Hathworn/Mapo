#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void current_calculate_postsynaptic_current_injection_kernel(float* d_synaptic_efficacies_or_weights, float* d_time_of_last_spike_to_reach_synapse, int* d_postsynaptic_neuron_indices, float* d_neurons_current_injections, float current_time_in_seconds, size_t total_number_of_synapses) {

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Improved loop structure, removed unnecessary __syncthreads
    while (idx < total_number_of_synapses) {
        
        if (d_time_of_last_spike_to_reach_synapse[idx] == current_time_in_seconds) {
            // Use atomic operation for concurrent additions
            atomicAdd(&d_neurons_current_injections[d_postsynaptic_neuron_indices[idx]], d_synaptic_efficacies_or_weights[idx]);
        }
        
        idx += blockDim.x * gridDim.x;
    }
}