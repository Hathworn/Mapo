#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Optimize by using shared memory when beneficial (e.g., for reusing data within a block)
    extern __shared__ float sharedMem[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        // Preload elements into shared memory to reduce global memory access (stride could be added if needed)
        sharedMem[threadIdx.x] = A[i] + B[i];
        __syncthreads(); // Ensure all threads have finished loading before updating global memory

        // Write the result back to global memory
        C[i] = sharedMem[threadIdx.x];
    }
}