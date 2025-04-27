#include "hip/hip_runtime.h"
#include "includes.h"

// CUDA runtime

__global__ void cube(float *d_out, float *d_in) {
    // Use blockIdx.x to handle larger arrays beyond one block
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Cube computation
    float f = d_in[idx];
    d_out[idx] = f * f * f;
}