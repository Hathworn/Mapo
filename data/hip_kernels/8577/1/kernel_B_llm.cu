#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_B( float *g_data, int dimx, int dimy )
{
    int id  = blockIdx.x * blockDim.x + threadIdx.x;

    // Load value from global memory
    float value = g_data[id];

    // Use ternary operator to eliminate branching
    value += sqrtf((id % 2 ? logf(value) : cosf(value)) + 1.f);

    // Store result back in global memory
    g_data[id] = value;
}