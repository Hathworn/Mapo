#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Ecalc2(float* __restrict__ out, const float* __restrict__ label)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < gridDim.x * blockDim.x) { // Check bounds
        out[i] = label[i] - out[i];
    }
}