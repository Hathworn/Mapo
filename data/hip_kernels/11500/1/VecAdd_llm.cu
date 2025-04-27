#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory for better memory access patterns in coalesced reads
    extern __shared__ float sdata[];

    if (i < N) {
        // Load A and B elements into shared memory
        sdata[i] = A[i];
        __syncthreads();

        // Perform the addition
        sdata[i] += B[i];
        __syncthreads();

        // Store the result back to global memory
        C[i] = sdata[i];
    }
}