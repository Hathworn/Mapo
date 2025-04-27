#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Improve data locality by precomputing bounds
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access (if further optimization needed)
    extern __shared__ float shared[];
    float *sA = shared;
    float *sB = shared + blockDim.x;

    if (i < n) {
        // Prefetch data into shared memory
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
        __syncthreads();

        unsigned int k = i + offset;
        if (k < n) {
            // Access shared memory instead of global memory
            C[k] = sA[threadIdx.x] + sB[threadIdx.x];
        }
    }
}