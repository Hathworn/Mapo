#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorMul(const float *A, const float *B, float *C, int numElements)
{
    // Use shared memory to improve memory access efficiency
    extern __shared__ float sdata[];

    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + tid;

    // Load data into shared memory
    if (i < numElements) {
        sdata[tid] = A[i] * B[i];
    }

    __syncthreads();

    // Write result back to global memory
    if (i < numElements) {
        C[i] = sdata[tid];
    }
}