#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poisson_update_membrane_potentials_kernel(hiprandState_t* d_states, float *d_rates, float *d_membrane_potentials_v, float timestep, float *d_thresholds_for_action_potential_spikes, size_t total_number_of_input_neurons, int current_stimulus_index) {

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    while (idx < total_number_of_input_neurons) {
        
        // Calculate rate index directly from idx
        int rate_index = total_number_of_input_neurons * current_stimulus_index + idx;

        float rate = d_rates[rate_index];

        if (rate > 0.1) {

            // Generate random float using a separate seed for each thread
            float random_float = hiprand_uniform(&d_states[idx]);

            // Check if random number is less than rate * timestep
            if (random_float < (rate * timestep)) {

                // Update membrane potential if condition is met
                d_membrane_potentials_v[idx] = d_thresholds_for_action_potential_spikes[idx] + 0.02;
            }
        }

        idx += blockDim.x * gridDim.x;
    }
}