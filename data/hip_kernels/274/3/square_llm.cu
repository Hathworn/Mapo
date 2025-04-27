#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float* d_out, float* d_in)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    float f = d_in[idx];
    d_out[idx] = f * f;
}