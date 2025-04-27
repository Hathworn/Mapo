#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InvertPermutationKernel(float* input, float* output, int size)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x; // Optimize block index calculation

    if (id < size) // Check within range early
    {
        int temp = __float2int_rn(input[id]); 

        if (input == output) 
            __syncthreads();

        output[temp] = id;
    }
}