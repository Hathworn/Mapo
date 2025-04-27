#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void momentum_update_1D_1D(float* x, float* d, float* m, float learning_rate, float momentum, float gradClip, bool nesterov, int size) {
    // Calculate thread id and stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    for (; tid < size; tid += stride) {
        float temp = d[tid];
        
        // Apply gradient clipping
        temp = max(min(temp, gradClip), -gradClip);

        // Update momentum
        float m_val = m[tid] * momentum + temp;

        // Update parameter using Nesterov or standard method
        x[tid] -= learning_rate * (nesterov ? temp + momentum * m_val : m_val);

        // Store updated momentum and reset gradient
        m[tid] = m_val;
        d[tid] = 0;
    }
}