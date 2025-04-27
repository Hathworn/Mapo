#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lif_update_membrane_potentials(float *d_membrane_potentials_v, float *d_membrane_resistances_R, float *d_membrane_time_constants_tau_m, float *d_resting_potentials, float* d_current_injections, float timestep, size_t total_number_of_neurons) {
    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Process multiple neurons per thread to improve occupancy
    int stride = blockDim.x * gridDim.x;
    
    for (int neuron_idx = idx; neuron_idx < total_number_of_neurons; neuron_idx += stride) {
        float equation_constant = timestep / d_membrane_time_constants_tau_m[neuron_idx];
        float membrane_potential_Vi = d_membrane_potentials_v[neuron_idx];
        float current_injection_Ii = d_current_injections[neuron_idx];
        float resting_potential_V0 = d_resting_potentials[neuron_idx];
        float temp_membrane_resistance_R = d_membrane_resistances_R[neuron_idx];
        
        // Compute new membrane potential
        float new_membrane_potential = equation_constant * (resting_potential_V0 + temp_membrane_resistance_R * current_injection_Ii) + (1 - equation_constant) * membrane_potential_Vi;

        d_membrane_potentials_v[neuron_idx] = new_membrane_potential;
    }
    // Remove __syncthreads() as it's unnecessary here
}