#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float *d_out, float *d_in)
{
    // Use blockIdx.x for indexing to handle larger arrays
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate the cube directly into the output array
    d_out[idx] = d_in[idx] * d_in[idx] * d_in[idx];
}