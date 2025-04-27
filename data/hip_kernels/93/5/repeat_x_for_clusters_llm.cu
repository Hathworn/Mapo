#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void repeat_x_for_clusters(float *x, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within size directly, no need for block index check
    if (index < size)
    {
        // Use shared memory to reduce redundant global memory access
        __shared__ float shared_mem[blockDim.x];
        shared_mem[threadIdx.x] = x[threadIdx.x];
        __syncthreads();

        x[index] = shared_mem[threadIdx.x];
    }
}