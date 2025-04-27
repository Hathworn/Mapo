#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conductance_calculate_postsynaptic_current_injection_kernel( float* decay_term_values, float* reversal_values, int num_decay_terms, int* synapse_decay_values, float* neuron_wise_conductance_traces, float* d_neurons_current_injections, float * d_membrane_potentials_v, float timestep, size_t total_number_of_neurons){

    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure no unnecessary branching by initializing current injection
    bool is_idx_valid = (idx < total_number_of_neurons);
    if (is_idx_valid) {
        d_neurons_current_injections[idx] = 0.0f;
        float membrane_potential_v = d_membrane_potentials_v[idx];

        // Loop unrolling and reduced memory access
        #pragma unroll
        for (int decay_id = 0; decay_id < num_decay_terms; decay_id++) {
            float synaptic_conductance_g = neuron_wise_conductance_traces[idx + decay_id*total_number_of_neurons];

            // Reduce exp computation overhead
            float decay_factor = expf(-timestep / decay_term_values[decay_id]);
            synaptic_conductance_g *= decay_factor;

            neuron_wise_conductance_traces[idx + decay_id*total_number_of_neurons] = synaptic_conductance_g;

            // Inline calculation of current injection
            d_neurons_current_injections[idx] += synaptic_conductance_g * (reversal_values[decay_id] - membrane_potential_v);
        }
    }
}