```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void izhikevich_update_membrane_potentials_kernel(float *d_membrane_potentials_v, float *d_states_u, float *d_param_a, float *d_param_b, float* d_current_injections, float* thresholds_for_action_potentials, float* last_spike_time_of_each_neuron, float* resting_potentials, float current_time_in_seconds, float timestep, size_t total_number_of_neurons) {

    // Convert timestep to milliseconds
    float eqtimestep = timestep * 1000.0f;
    // Get thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for optimization

    while (idx < total_number_of_neurons) {
        // Compute updates for each neuron using Izhikevich equations
        float v = d_membrane_potentials_v[idx];
        float u = d_states_u[idx];
        float v_update = 0.04f * v * v + 5.0f * v + 140 - u + d_current_injections[idx];

        v += eqtimestep * v_update;
        u += eqtimestep * (d_param_a[idx] * (d_param_b[idx] * v - u));

        // Check for action potential threshold
        if (v >= thresholds_for_action_potentials[idx]) {
            v = resting_potentials[idx];
            last_spike_time_of_each_neuron[idx] = current_time_in_seconds;
        }

        // Intermediate results stored back
        d_membrane_potentials_v[idx] = v;
        d_states_u[idx] = u;

        // Move to the next neuron index
        idx += stride;
    }
    // Ensure all threads complete computations
    __syncthreads();
}