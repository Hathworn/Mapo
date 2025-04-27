#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulatedPartSizesKernel(int size, int *part, int *weights, int *accumulatedSize)
{
    // Use shared memory to minimize global memory accesses.
    __shared__ int sharedWeights[256];
  
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Load data into shared memory, if within bounds.
    if (idx < size) {
        sharedWeights[threadIdx.x] = weights[idx];
        __syncthreads();
        
        int thisPart = part[idx];
        
        // Update accumulatedSize using shared memory, if within bounds.
        if (idx == size - 1 || thisPart != part[idx + 1]) {
            atomicAdd(&accumulatedSize[thisPart], sharedWeights[threadIdx.x]);
        }
    }
}