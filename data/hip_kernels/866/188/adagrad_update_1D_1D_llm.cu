#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use a while loop for better readability and structure
    while (tid < size) {
        // Clip gradients more efficiently using fminf/fmaxf
        d[tid] = fmaxf(fminf(d[tid], clip), -clip);

        // Update accumulator and parameters
        m[tid] += d[tid] * d[tid];
        x[tid] -= lr * d[tid] / sqrtf(m[tid] + 1e-8f);

        // Reset gradient
        d[tid] = 0;

        tid += stride;
    }
}