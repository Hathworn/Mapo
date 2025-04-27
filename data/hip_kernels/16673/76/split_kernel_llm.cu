#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void split_kernel(float *d_output, float *d_input, float *d_predicates, float *d_scanned, int length)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if index is within range
    if (idx >= length) return;

    // Use shared memory to minimize global memory access
    __shared__ float shared_input[blockDim.x];
    __shared__ float shared_predicates[blockDim.x];
    __shared__ float shared_scanned[blockDim.x];

    shared_input[threadIdx.x] = d_input[idx];
    shared_predicates[threadIdx.x] = d_predicates[idx];
    shared_scanned[threadIdx.x] = d_scanned[idx];

    __syncthreads();

    if (shared_predicates[threadIdx.x] != 0.f)
    {
        // Calculate address and assign value
        int address = shared_scanned[threadIdx.x] - 1;
        if (address >= 0 && address < length) // Ensure address is within bounds
        {
            d_output[idx] = shared_input[address];
        }
    }
}