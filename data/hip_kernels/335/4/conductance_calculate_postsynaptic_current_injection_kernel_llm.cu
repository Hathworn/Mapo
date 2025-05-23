#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conductance_calculate_postsynaptic_current_injection_kernel(
    int *d_presynaptic_neuron_indices,
    int *d_postsynaptic_neuron_indices,
    float *d_reversal_potentials_Vhat,
    float *d_neurons_current_injections,
    size_t total_number_of_synapses,
    float *d_membrane_potentials_v,
    float *d_synaptic_conductances_g) {

    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process synapses assigned to this thread
    while (idx < total_number_of_synapses) {
        float reversal_potential_Vhat = d_reversal_potentials_Vhat[idx];
        int postsynaptic_neuron_index = d_postsynaptic_neuron_indices[idx];
        float membrane_potential_v = d_membrane_potentials_v[postsynaptic_neuron_index];
        float synaptic_conductance_g = d_synaptic_conductances_g[idx];

        // Calculate the current component for the specific synapse
        float component_for_sum = synaptic_conductance_g * (reversal_potential_Vhat - membrane_potential_v);

        // Use atomic add only if component_for_sum is non-zero
        if (component_for_sum != 0.0f) {
            atomicAdd(&d_neurons_current_injections[postsynaptic_neuron_index], component_for_sum);
        }

        // Advance index for next iteration
        idx += blockDim.x * gridDim.x;
    }

    // Remove unnecessary barrier synchronization, it's only required for shared memory
}