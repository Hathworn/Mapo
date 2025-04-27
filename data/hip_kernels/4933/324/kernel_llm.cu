#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *g_data, float value)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Coalesced memory access for improved memory bandwidth usage
    if (idx < gridDim.x * blockDim.x) {
        g_data[idx] += value;
    }
}