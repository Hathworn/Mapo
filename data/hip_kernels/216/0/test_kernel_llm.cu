#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test_kernel()
{
    // Using cooperative grid synchronization
    __shared__ bool isLastBlockDone;
    if (threadIdx.x == 0) isLastBlockDone = false;
    __syncthreads();

    // Only first thread in each block performs operation to avoid congestion
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("test_kernel() - First Thread in Block\n");
    }
    
    __syncthreads();
    if (threadIdx.x == 0) {
        isLastBlockDone = true;
    }
    __syncthreads();

    // Sync all blocks
    if (isLastBlockDone) {
        if (threadIdx.x == 0 && blockIdx.x == 0) {
            printf("test_kernel() - All Blocks Synchronized\n");
        }
    }
}