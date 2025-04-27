#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weight_update(int* postsyn_neuron, bool* neuron_in_plasticity_set, float* current_weight, float* weight_divisor, int* d_plastic_synapse_indices, size_t total_number_of_plastic_synapses) {

    // Calculate global index
    int indx = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop optimally through all synapses using grid stride
    for (; indx < total_number_of_plastic_synapses; indx += blockDim.x * gridDim.x) {
        int idx = d_plastic_synapse_indices[indx];
        int postneuron = postsyn_neuron[idx];

        // Check neuron plasticity status
        if (neuron_in_plasticity_set[postneuron]) {
            float division_value = weight_divisor[postneuron];

            // Avoid unnecessary division operations
            if (division_value != 1.0f) {
                current_weight[idx] /= division_value;
            }
        }
    }
}