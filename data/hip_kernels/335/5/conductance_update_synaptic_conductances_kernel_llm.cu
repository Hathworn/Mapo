#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conductance_update_synaptic_conductances_kernel(float timestep, float * d_synaptic_conductances_g, float * d_synaptic_efficacies_or_weights, float * d_time_of_last_spike_to_reach_synapse, float * d_biological_conductance_scaling_constants_lambda, int total_number_of_synapses, float current_time_in_seconds, float * d_decay_terms_tau_g) {

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Cache stride computation
    while (idx < total_number_of_synapses) {
        float synaptic_conductance_g = d_synaptic_conductances_g[idx];
        float decay_term = 1.0 - (timestep / d_decay_terms_tau_g[idx]); // Cache decay computation
        float new_conductance = decay_term * synaptic_conductance_g;

        if (d_time_of_last_spike_to_reach_synapse[idx] == current_time_in_seconds) {
            // Combine multipliers into a single operation for new conductance update
            new_conductance += timestep * d_synaptic_efficacies_or_weights[idx] * d_biological_conductance_scaling_constants_lambda[idx];
        }

        // Only write to global memory if there's a change
        if (synaptic_conductance_g != new_conductance) {
            d_synaptic_conductances_g[idx] = new_conductance;
        }

        idx += stride;
    }
}