#include "hip/hip_runtime.h"
#include "includes.h"
/////////////////////////////////////////////////////////

// Computes the 1-stencil using GPUs.

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

__global__ void one_stencil (int *A, int *B, int sizeOfA)
{
    extern __shared__ int s[];
    
    int localId = threadIdx.x;
    int startOfBlock = blockIdx.x * blockDim.x;
    int globalId = localId + startOfBlock;

    if (globalId >= sizeOfA)
        return;

    // Load data into shared memory with boundary check
    s[localId] = A[globalId];
    if (localId < 2 && blockDim.x + globalId < sizeOfA) {
        s[blockDim.x + localId] = A[blockDim.x + globalId];
    }
    
    __syncthreads(); // Synchronize threads for shared memory access

    // Compute result using shared memory
    if (globalId < sizeOfA - 2) {
        B[globalId] = s[localId] + s[localId + 1] + s[localId + 2];
    }
}