#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void update_synaptic_efficacies_or_weights_kernel(float * d_recent_presynaptic_activities_C, float * d_recent_postsynaptic_activities_D, int* d_postsynaptic_neuron_indices, float* d_synaptic_efficacies_or_weights, float current_time_in_seconds, float * d_time_of_last_spike_to_reach_synapse, float * d_last_spike_time_of_each_neuron, bool* d_stdp, size_t total_number_of_synapses, float learning_rate_rho) {

    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a more efficient loop by handling condition checks in fewer operations
    for (; idx < total_number_of_synapses; idx += blockDim.x * gridDim.x) {
        if (d_stdp[idx]) {
            float synaptic_efficacy_delta_g = d_synaptic_efficacies_or_weights[idx];
            float new_synaptic_efficacy = synaptic_efficacy_delta_g;
            float new_componet = 0.0f;
            
            int postsynaptic_neuron_index = d_postsynaptic_neuron_indices[idx];

            // Combine condition checks to reduce branching
            if (d_last_spike_time_of_each_neuron[postsynaptic_neuron_index] == current_time_in_seconds) {
                new_componet += (1.0f - synaptic_efficacy_delta_g) * d_recent_presynaptic_activities_C[idx];
            }

            if (d_time_of_last_spike_to_reach_synapse[idx] == current_time_in_seconds) {
                new_componet -= synaptic_efficacy_delta_g * d_recent_postsynaptic_activities_D[postsynaptic_neuron_index];
            }

            // Use a direct computation to update synaptic efficacy
            if (new_componet != 0.0f) {
                new_synaptic_efficacy += learning_rate_rho * new_componet;
                // Clamp the updated synaptic efficacy between 0 and 1
                new_synaptic_efficacy = fminf(fmaxf(new_synaptic_efficacy, 0.0f), 1.0f);

                // Update synaptic efficacies
                if (synaptic_efficacy_delta_g != new_synaptic_efficacy) {
                    d_synaptic_efficacies_or_weights[idx] = new_synaptic_efficacy;
                }
            }
        }
    }
}