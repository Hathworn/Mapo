#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void innerProd(float *aa, float *bb, float *cc)
{
    __shared__ float temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure index is within bounds to avoid out-of-bounds access
    if (index < gridDim.x * blockDim.x) {
        temp[threadIdx.x] = aa[index] * bb[index];
    } else {
        temp[threadIdx.x] = 0.0f;
    }

    __syncthreads(); // Synchronize to ensure all threads have written to shared memory

    // Perform parallel reduction within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            temp[threadIdx.x] += temp[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Only the first thread of each block adds the result to cc
    if (threadIdx.x == 0) {
        atomicAdd(cc, temp[0]);
    }
}