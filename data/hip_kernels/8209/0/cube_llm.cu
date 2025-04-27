#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float * d_out, float * d_in) {
    // Using blockIdx and blockDim for accessing global index in grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    float f = d_in[idx];
    d_out[idx] = f * f * f;
}