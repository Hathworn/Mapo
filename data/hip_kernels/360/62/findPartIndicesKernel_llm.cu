#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findPartIndicesKernel(int size, int *array, int *partIndices)
{
    // Optimize memory accesses using shared memory
    extern __shared__ int sharedArray[];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < size)
    {
        // Load data into shared memory
        sharedArray[threadIdx.x] = array[idx];
        __syncthreads();

        int value = sharedArray[threadIdx.x];
        int nextValue = (idx != size - 1 && threadIdx.x < blockDim.x - 1) ? sharedArray[threadIdx.x + 1] : array[idx + 1];
        
        // Atomic operation to prevent race conditions
        if (value != nextValue)
        {
            atomicMax(&partIndices[value + 1], idx + 1);
        }
    }
}