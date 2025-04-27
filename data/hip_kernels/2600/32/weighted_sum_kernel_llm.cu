#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void weighted_sum_kernel(int n, float *a, float *b, float *s, float *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D grid for simplicity
    int totalThreads = blockDim.x * gridDim.x; // Calculate total number of threads
    for (; i < n; i += totalThreads) { // Loop to cover all elements
        float b_val = (b != nullptr) ? b[i] : 0; // Conditional b element retrieval
        c[i] = s[i] * a[i] + (1.0f - s[i]) * b_val; // Calculate weighted sum
    }
}