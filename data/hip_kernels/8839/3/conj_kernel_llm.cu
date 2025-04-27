#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conj_kernel(float *data, float *result)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Optimize calculation of linear index
    int offset = blockIdx.y * gridDim.x * blockDim.x; // Calculate offset for 2D grid
    int threadId = 2 * (offset + idx); // Combine into single index calculation for clarity

    result[threadId] = data[threadId];
    result[threadId + 1] = -data[threadId + 1];
}