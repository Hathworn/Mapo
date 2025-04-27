#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kLowerBoundScalar(float* mat, float val, float* target, unsigned int len) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop stride using total number of threads
    for (unsigned int i = idx; i < len; i += gridDim.x * blockDim.x) {
        float m_val = mat[i];
        target[i] = m_val < val ? val : m_val;  // Load once, reduce potential latency
    }
}