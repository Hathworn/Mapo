#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_SHAREDSIZE 2048

__global__ void LoadStoreViaSharedMemory(int *In, int *Out)
{
#if 1
    int LoadStoreSize = MAX_SHAREDSIZE / blockDim.x;
    int beginIndex = threadIdx.x * LoadStoreSize;
    int endIndex = beginIndex + LoadStoreSize;

    // Optimize memory access by storing into registers first
    __shared__ int SharedMemory[MAX_SHAREDSIZE];
    int temp[MAX_SHAREDSIZE / blockDim.x];  // Use local memory for faster access
    int i;

    for (i = 0; i < LoadStoreSize; i++) {
        temp[i] = In[beginIndex + i];
    }

    __syncthreads();

    for (i = 0; i < LoadStoreSize; i++) {
        SharedMemory[beginIndex + i] = temp[i];  // Use shared memory for efficient access
    }

    __syncthreads();

    for (i = 0; i < LoadStoreSize; i++) {
        Out[beginIndex + i] = SharedMemory[beginIndex + i];
    }

    __syncthreads();
#else
    __shared__ int SharedMemory[MAX_SHAREDSIZE];

    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    SharedMemory[idx] = In[idx];
    Out[idx] = SharedMemory[idx];
#endif
}