#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float *d_out, float *d_in) {
    // Use blockIdx.x and blockDim.x for multi-block capability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid invalid memory access
    if (idx < N) { // Assume N is defined as the size of d_in and d_out
        float f = d_in[idx];
        d_out[idx] = f * f;
    }
}