#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void k_zero_comp_xyz(float *data, uint n, uint stride)
{
    // Calculate the global thread ID
    uint i = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the starting index for data pointer based on 'p'
    uint baseIndex = blockIdx.y * stride;

    // Ensure the thread index is within bounds
    if (i < n) {
        // Access the data array with precomputed index
        data[baseIndex + i] = 0.f;
    }
}