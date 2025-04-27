#include "hip/hip_runtime.h"
#include "includes.h"
/////////////////////////////////////////////////////////

#define BLOCK_SIZE 1024
#define WARP_SIZE 32

#ifndef k
#define k 3
#endif
#ifndef OUTPUT_PER_THREAD
#define OUTPUT_PER_THREAD 1
#endif
#define LOCAL_REGISTER_SIZE ((1+OUTPUT_PER_THREAD) > (k+31)/32 ? (1+OUTPUT_PER_THREAD) : (k+31)/32)
#ifndef TEST_TIMES
#define TEST_TIMES 5
#endif

float host_k_stencil (int *A, int *B, int sizeOfA, int withRc);

__global__ void k_stencil (int *A, int *B, int sizeOfA)
{
    extern __shared__ int s[];
    int localId = threadIdx.x;
    int startOfBlock = blockIdx.x * blockDim.x * OUTPUT_PER_THREAD;
    int globalId = localId + startOfBlock;

    if (globalId >= sizeOfA)
        return;

    // Efficient loading with boundary checks
    for (int i = 0; i < OUTPUT_PER_THREAD && (globalId + i * BLOCK_SIZE) < sizeOfA; ++i)
    {
        s[localId + i * BLOCK_SIZE] = A[globalId + i * BLOCK_SIZE];
    }

    if (localId < k && (globalId + blockDim.x * OUTPUT_PER_THREAD) < sizeOfA)
    {
        s[localId + blockDim.x * OUTPUT_PER_THREAD] = A[globalId + blockDim.x * OUTPUT_PER_THREAD];
    }
    
    __syncthreads();

    // Re-use of computed results for better throughput
    for (int j = 0; j < OUTPUT_PER_THREAD && (globalId + j * BLOCK_SIZE) < (sizeOfA - k); ++j)
    {
        int sum = 0;
        for (int i = 0; i < k + 1; ++i)
        {
            sum += s[localId + j * BLOCK_SIZE + i];
        }
        B[globalId + BLOCK_SIZE * j] = sum;
    }
}