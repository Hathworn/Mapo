#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use a while loop for better readability
    while (tid < size) {
        float temp = d[tid];

        // Apply gradient clipping
        if (temp > gradClip) temp = gradClip;
        if (temp < -gradClip) temp = -gradClip;

        // Update momentum
        m[tid] = momentum * m[tid] + temp;

        // Compute the temp value based on the nesterov setting
        if (nesterov) {
            temp += momentum * m[tid];
        } else {
            temp = m[tid];
        }

        // Update x and reset d
        x[tid] -= learning_rate * temp;
        d[tid] = 0;

        tid += stride;
    }
}