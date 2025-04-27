#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ConstantB(bool * x, bool value, size_t idx, size_t N)
{
    // Compute global index once outside of loop
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory if beneficial (example use of shared memory not shown due to brevity)
    // __shared__ bool sharedArray[BLOCK_SIZE]; 

    for (int i = globalIndex; i < N; i += stride)
    {
        x[idx * N + i] = value;
    }
}