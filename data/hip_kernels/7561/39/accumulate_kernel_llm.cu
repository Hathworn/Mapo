#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Use shared memory for better memory access coalescing
    __shared__ float partialSum[256]; // Adjust size according to blockDim.x

    partialSum[threadIdx.x] = 0.0f;

    // Unroll loop for efficient memory access
    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        partialSum[threadIdx.x] += x[k * groups + i];
    }
    __syncthreads();

    // Reduce within block
    if (threadIdx.x == 0) {
        for (int j = 1; j < blockDim.x; j++) {
            partialSum[0] += partialSum[j];
        }
        sum[i] = partialSum[0];
    }
}