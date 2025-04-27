#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_postsynaptic_activities_kernel(float timestep, size_t total_number_of_neurons, float *d_recent_postsynaptic_activities_D, float *d_last_spike_time_of_each_neuron, float current_time_in_seconds, float decay_term_tau_D, float model_parameter_alpha_D) {

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop for better performance.
    for (int i = idx; i < total_number_of_neurons; i += blockDim.x * gridDim.x) {
        float recent_postsynaptic_activity_D = d_recent_postsynaptic_activities_D[i];
        
        // Combine calculations to reduce operations.
        float new_recent_postsynaptic_activity_D = recent_postsynaptic_activity_D * (1 - (timestep / decay_term_tau_D));
        
        if (d_last_spike_time_of_each_neuron[i] == current_time_in_seconds) {
            new_recent_postsynaptic_activity_D += timestep * model_parameter_alpha_D * (1 - recent_postsynaptic_activity_D);
        }
        
        d_recent_postsynaptic_activities_D[i] = new_recent_postsynaptic_activity_D;
    }
}