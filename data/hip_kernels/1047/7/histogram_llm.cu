#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram (unsigned char *utime, unsigned int* histo, size_t n)
{
    __shared__ unsigned int lhisto[512];

    // Initialize shared memory
    lhisto[threadIdx.x] = 0;
    __syncthreads();

    int globalIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimization: combine two separate loops into one for simplicity
    for (int i = globalIndex; i < n; i += blockDim.x * gridDim.x) {
        int offset = (i < n / 2) ? 0 : 256;
        atomicAdd(&lhisto[utime[i] + offset], 1);
    }
    __syncthreads();

    // Global accumulation
    atomicAdd(&histo[threadIdx.x], lhisto[threadIdx.x]);
}