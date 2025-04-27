#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_presynaptic_activities_C_kernel(float* d_recent_presynaptic_activities_C, float* d_time_of_last_spike_to_reach_synapse, bool* d_stdp, float timestep, float current_time_in_seconds, size_t total_number_of_synapses, float synaptic_neurotransmitter_concentration_alpha_C, float decay_term_tau_C) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Loop unrolling for better occupancy
    for (size_t stride = blockDim.x * gridDim.x; idx < total_number_of_synapses; idx += stride) {
        if (d_stdp[idx]) {
            float recent_presynaptic_activity_C = d_recent_presynaptic_activities_C[idx];
            float decay_factor = (1 - (timestep / decay_term_tau_C));
            float new_recent_presynaptic_activity_C = decay_factor * recent_presynaptic_activity_C;

            // Consolidated condition check to reduce branch divergence
            if (d_time_of_last_spike_to_reach_synapse[idx] == current_time_in_seconds) {
                new_recent_presynaptic_activity_C += timestep * synaptic_neurotransmitter_concentration_alpha_C * (1 - recent_presynaptic_activity_C);
            }

            d_recent_presynaptic_activities_C[idx] = new_recent_presynaptic_activity_C;
        }
    }
}