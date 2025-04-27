#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const uint16_t* A, const uint16_t* B, uint16_t* C, uint32_t numElements)
{
    // Calculate global thread ID
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Process multiple elements per thread to increase data throughput
    int gridSize = blockDim.x * gridDim.x;
    
    // Unroll loops for better performance
    while (i < numElements)
    {
        C[i] = A[i] + B[i];
        i += gridSize;
    }
}