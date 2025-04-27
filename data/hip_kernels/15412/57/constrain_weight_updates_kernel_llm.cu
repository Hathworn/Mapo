#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constrain_weight_updates_kernel(int N, float coef, float *weights_gpu, float *weight_updates_gpu) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (i < N) {
        const float w = weights_gpu[i];
        const float wu = weight_updates_gpu[i];
        const float wu_sign = copysignf(1.0f, wu); // Use copysign to determine the sign of wu
        const float abs_limit = fabsf(w * coef);

        // Constrain weight updates
        if (fabsf(wu) > abs_limit) {
            weight_updates_gpu[i] = abs_limit * wu_sign;
        }
    }
}