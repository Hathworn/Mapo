#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void findPartIndicesNegStartKernel(int size, int *array, int *partIndices)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 1;
    if(idx < size)
    {
        int value = array[idx];
        int nextValue = array[idx + 1];
        // Reduce memory access by using shared memory
        __shared__ int sharedArray[256];
        int localIdx = threadIdx.x + 1;
        if(localIdx < blockDim.x)
        {
            sharedArray[localIdx] = array[idx];
            sharedArray[localIdx + 1] = array[idx + 1];
        }
        __syncthreads(); // Ensure all threads have loaded data into shared memory
        if(localIdx < blockDim.x && sharedArray[localIdx] != sharedArray[localIdx + 1])
        {
            partIndices[sharedArray[localIdx] + 1] = idx;
        }
    }
}