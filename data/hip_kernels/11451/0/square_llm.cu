#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float * d_out, float * d_in) {
    // Use blockIdx and blockDim to handle larger input data
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the index is within the bounds of the data
    if (idx < N) {
        float f = d_in[idx];
        d_out[idx] = f * f;
    }
}