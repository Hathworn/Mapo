#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devFindUniqueTriangleAffected(int maxIndex, int *pTriangleAffected, int *pTriangleAffectedIndex, int *pUniqueFlag)
{
    // Using shared memory to cache triangle affected data
    extern __shared__ int sharedMem[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x + 1;

    while (i < maxIndex) {
        // Load data to shared memory
        sharedMem[tid] = pTriangleAffected[i];
        __syncthreads(); // Ensure all threads have loaded their data
        
        if (tid > 0 && sharedMem[tid-1] == sharedMem[tid] && sharedMem[tid] != -1) {
            int j = pTriangleAffectedIndex[i];
            pUniqueFlag[j] = 0;
        }
        __syncthreads(); // Ensure all threads have updated the flag

        i += gridDim.x * blockDim.x;
    }
}