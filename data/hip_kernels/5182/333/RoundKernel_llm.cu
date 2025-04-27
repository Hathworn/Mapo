#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void RoundKernel(float* input, float* output, int size)
{
    // Calculate unique thread index within the grid
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory accesses
    extern __shared__ float shared_input[];
    
    if (id < size)
    {
        // Load data into shared memory
        shared_input[threadIdx.x] = input[id];
        __syncthreads();
        
        // Perform computation using shared memory
        output[id] = round(shared_input[threadIdx.x]);
    }
}