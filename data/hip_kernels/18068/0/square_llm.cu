#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float* d_in, float* d_out) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use blockIdx and blockDim for global indexing
    if (idx < gridDim.x * blockDim.x) {              // Ensure idx is within bounds
        float f = d_in[idx];
        d_out[idx] = f * f;
    }
}