#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void masquelier_get_indices_to_apply_stdp (
    int* d_postsyns, 
    float* d_last_spike_time_of_each_neuron, 
    float* d_time_of_last_spike_to_reach_synapse, 
    int* d_index_of_last_afferent_synapse_to_spike, 
    bool* d_isindexed_ltd_synapse_spike, 
    int* d_index_of_first_synapse_spiked_after_postneuron, 
    float currtime, 
    int* d_plastic_synapse_indices, 
    size_t total_number_of_plastic_synapses
) {
    int indx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate the stride

    // Loop through synapses with stride
    while (indx < total_number_of_plastic_synapses) {
        int idx = d_plastic_synapse_indices[indx];
        int postsynaptic_neuron = d_postsyns[idx];

        // Check if a synapse reached a neuron this timestep
        if (d_time_of_last_spike_to_reach_synapse[idx] == currtime) {
            atomicExch(&d_index_of_last_afferent_synapse_to_spike[postsynaptic_neuron], idx);
        }

        // Check if a synapse has fired and update if necessary
        if (!d_isindexed_ltd_synapse_spike[postsynaptic_neuron] && 
            d_time_of_last_spike_to_reach_synapse[idx] == currtime) {
            d_isindexed_ltd_synapse_spike[postsynaptic_neuron] = true;
            atomicExch(&d_index_of_first_synapse_spiked_after_postneuron[postsynaptic_neuron], idx);
        }

        // Move to the next index in the grid
        indx += stride;
    }
}