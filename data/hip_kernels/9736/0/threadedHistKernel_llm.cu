#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void threadedHistKernel(int *threadedHist, int *arr, const int blockSize, const int valRange, const int threadBlockSize)
{
    int tid = threadIdx.x;
    int pid = blockIdx.x * blockSize + tid;  // Positional ID

    // Use shared memory for reduced access latency
    __shared__ int sharedHist[1024];
    sharedHist[tid] = 0;
    __syncthreads();

    // Each thread increments the relevant position in the local histogram
    for (int i = 0; i < threadBlockSize; i++)
    {
        int val = arr[pid * threadBlockSize + i];
        atomicAdd(&sharedHist[val], 1);
    }
    __syncthreads();

    // Write shared histogram back to global memory
    for (int i = tid; i < valRange; i += blockSize)
    {
        threadedHist[valRange * pid + i] = sharedHist[i];
    }
}