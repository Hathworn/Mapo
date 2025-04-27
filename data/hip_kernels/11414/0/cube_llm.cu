#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float *d_out, float *d_in) {
    // Use blockDim.x for better scalability and idx calculation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx doesn't access out-of-bound memory
    if (idx < blockDim.x) {
        float f = d_in[idx];
        d_out[idx] = f * f * f;
    }
}