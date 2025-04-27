#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    // Calculate thread ID with stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize with shared memory and loop unrolling
    for (; tid < size; tid += stride) {
        float temp = d[tid];

        // Gradient clipping
        temp = max(min(temp, gradClip), -gradClip);

        // Update momentum
        m[tid] = m[tid] * momentum + temp;

        // Nesterov or standard momentum update
        temp = nesterov ? temp + momentum * m[tid] : m[tid];

        // Update parameter with learning rate
        x[tid] -= learning_rate * temp;

        // Reset gradient
        d[tid] = 0;
    }
}