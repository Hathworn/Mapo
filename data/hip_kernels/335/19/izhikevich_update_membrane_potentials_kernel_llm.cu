#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void izhikevich_update_membrane_potentials_kernel(float *d_membrane_potentials_v, float *d_states_u, float *d_param_a, float *d_param_b, float* d_current_injections, float timestep, size_t total_number_of_neurons) {

    // Precompute factor outside loop
    float eqtimestep = timestep * 1000.0f;

    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Efficiently iterate over neurons using stride loop pattern
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < total_number_of_neurons; i += stride) {
        // Update membrane potentials using Izhikevich equations
        float v_update = 0.04f * d_membrane_potentials_v[i] * d_membrane_potentials_v[i]
                         + 5.0f * d_membrane_potentials_v[i]
                         + 140.0f
                         - d_states_u[i]
                         + d_current_injections[i];

        // Atomic operations to avoid race conditions
        d_membrane_potentials_v[i] += eqtimestep * v_update;
        d_states_u[i] += eqtimestep * (d_param_a[i] * (d_param_b[i] * d_membrane_potentials_v[i] - d_states_u[i]));
    }

    // Synchronization not needed within kernel scope for this use case
}