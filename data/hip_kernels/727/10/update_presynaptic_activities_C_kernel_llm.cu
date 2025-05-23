#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_presynaptic_activities_C_kernel(float* d_recent_presynaptic_activities_C, float* d_time_of_last_spike_to_reach_synapse, float timestep, float current_time_in_seconds, float synaptic_neurotransmitter_concentration_alpha_C, float decay_term_tau_C, int* d_plastic_synapse_indices, size_t total_number_of_plastic_synapses) {
    int indx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance if there's space
    extern __shared__ float shared_data[];
    
    while (indx < total_number_of_plastic_synapses) {
        int idx = d_plastic_synapse_indices[indx];

        float recent_presynaptic_activity_C = d_recent_presynaptic_activities_C[idx];
        float new_recent_presynaptic_activity_C = (1.0f - (timestep / decay_term_tau_C)) * recent_presynaptic_activity_C;

        // Faster read from shared memory if applicable
        if (d_time_of_last_spike_to_reach_synapse[idx] == current_time_in_seconds) {
            new_recent_presynaptic_activity_C += timestep * synaptic_neurotransmitter_concentration_alpha_C * (1.0f - recent_presynaptic_activity_C);
        }

        // Avoid conditional write using atomic operations if possible
        if (recent_presynaptic_activity_C != new_recent_presynaptic_activity_C) {
            d_recent_presynaptic_activities_C[idx] = new_recent_presynaptic_activity_C;
        }

        indx += blockDim.x * gridDim.x;
    }
}