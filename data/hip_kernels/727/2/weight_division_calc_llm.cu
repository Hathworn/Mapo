#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void weight_division_calc(float* sum_squared_afferent_values, float* afferent_weight_change_updater, float* weight_divisor, bool* neuron_in_plasticity_set, size_t total_number_of_neurons)
{
    // Global Index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Calculate the stride

    // Loop unrolling could be possible for more throughput
    for (; idx < total_number_of_neurons; idx += stride) {
        if (neuron_in_plasticity_set[idx]) {
            float sum_sq_value = sum_squared_afferent_values[idx];
            float weight_update = afferent_weight_change_updater[idx];
            if ((sum_sq_value - weight_update < 0.01))
                printf("NORMALIZATION DIFF VERY LARGE. DANGER OF SYNAPSES ALL -> ZERO");
            weight_divisor[idx] = sqrtf(sum_sq_value + weight_update) / sqrtf(sum_sq_value);
        }
    }
    // __syncthreads() is unnecessary as there's no shared memory used
}