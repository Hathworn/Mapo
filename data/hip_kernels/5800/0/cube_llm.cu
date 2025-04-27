#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cube(float *d_out, float *d_in) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    float f = d_in[idx];
    d_out[idx] = f * f * f; // Cube calculation remains the same
}