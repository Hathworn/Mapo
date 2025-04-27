#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void reset_states_u_after_spikes_kernel(float *d_states_u, float *d_param_d, float* d_last_spike_time_of_each_neuron, float current_time_in_seconds, size_t total_number_of_neurons) {
    // Calculate index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Iterate over neurons efficiently
    for (; idx < total_number_of_neurons; idx += blockDim.x * gridDim.x) {
        // Check for spike time match and update state
        if (d_last_spike_time_of_each_neuron[idx] == current_time_in_seconds) {
            d_states_u[idx] += d_param_d[idx]; // Perform state update
        }
    }
}