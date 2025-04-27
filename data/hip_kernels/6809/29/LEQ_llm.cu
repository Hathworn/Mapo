#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void LEQ(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N)
{
    // Cache the grid size for reduced computation
    int gridSize = blockDim.x * gridDim.x;
    // Utilize shared memory for repeated data access within a block
    extern __shared__ float shared_xf[];
    
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < N; i += gridSize)
    {
        // Load elements that will be accessed more than once into shared memory
        shared_xf[threadIdx.x] = xf[(idxf - 2) * N + i];
        __syncthreads();

        // Perform the comparison using shared memory
        if (i < N) // Additional check to ensure within bounds
        {
            xb[idxb * N + i] = xf[(idxf - 1) * N + i] <= shared_xf[threadIdx.x];
        }
        __syncthreads();
    }
}