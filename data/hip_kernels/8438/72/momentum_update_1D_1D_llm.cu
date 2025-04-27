#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* __restrict__ x, float* __restrict__ d, float* __restrict__ m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better performance
    for (; tid < size; tid += stride) {
        float temp = d[tid];

        // Use ternary operators for better readability
        temp = (temp > gradClip) ? gradClip : ((temp < -gradClip) ? -gradClip : temp);

        m[tid] = m[tid] * momentum + temp;

        // Simplify condition with ternary operator
        x[tid] -= learning_rate * (nesterov ? temp + momentum * m[tid] : m[tid]);

        d[tid] = 0; // Reset d[tid] to zero
    }
}