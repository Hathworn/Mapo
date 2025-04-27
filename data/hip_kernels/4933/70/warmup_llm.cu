#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int N)
{
    // Improved memory access by using shared memory
    extern __shared__ float shared_memory[];
    float* sA = shared_memory;
    float* sB = shared_memory + blockDim.x;

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data from global to shared memory
    if (i < N) {
        sA[threadIdx.x] = A[i];
        sB[threadIdx.x] = B[i];
    }
    __syncthreads();

    // Ensure we don't access out of bounds
    if (i < N) C[i] = sA[threadIdx.x] + sB[threadIdx.x];
}