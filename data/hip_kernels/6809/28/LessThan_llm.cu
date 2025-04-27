#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LessThan(float * xf, bool * xb, size_t idxf, size_t idxb, size_t N)
{
    // Using shared memory for better memory access patterns
    extern __shared__ float sharedMem[];

    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load elements into shared memory within bounds
    if (i < N) {
        sharedMem[threadIdx.x] = xf[(idxf-1)*N + i];
        sharedMem[threadIdx.x + blockDim.x] = xf[(idxf-2)*N + i];
    }
    __syncthreads();

    // Perform comparison using shared memory within bounds
    if (i < N) {
        xb[idxb*N + i] = (sharedMem[threadIdx.x] < sharedMem[threadIdx.x + blockDim.x]);
    }
}