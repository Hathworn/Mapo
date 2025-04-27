#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unaccumulatedPartSizesKernel(int size, int *accumulatedSize, int *sizes)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load accumulatedSize into shared memory for improved access speed
    extern __shared__ int sharedAccumulated[];
    
    if (idx < size) {
        sharedAccumulated[threadIdx.x] = accumulatedSize[idx];
        __syncthreads(); // Synchronize to ensure all threads have loaded their data

        // Calculate sizes using shared memory
        if (idx == 0) {
            sizes[idx] = sharedAccumulated[0];
        } else {
            sizes[idx] = sharedAccumulated[threadIdx.x] - sharedAccumulated[threadIdx.x - 1];
        }
    }
}