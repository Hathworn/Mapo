#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void InvertPermutationKernel(float* input, float* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation with one-dimensional grid

    if (id < size) // Simplified boundary condition
    {
        int temp = __float2int_rn(input[id]);

        if (input == output) // Check if input is output
            __syncthreads();

        output[temp] = id;
    }
}