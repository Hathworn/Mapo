#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float * d_out, float * d_in) {
    int index = blockDim.x * blockIdx.x + threadIdx.x; // Compute global index
    float f = d_in[index];
    d_out[index] = f * f * f;
}