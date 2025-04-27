#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float * d_out, float * d_in) {
    // Use blockIdx and blockDim for better scalability
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    float f = d_in[index];
    d_out[index] = f * f * f;
}