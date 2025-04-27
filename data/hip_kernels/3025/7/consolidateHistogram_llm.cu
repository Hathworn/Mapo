#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void consolidateHistogram(ulong* blockHistograms, ulong* cudaHistogram, uint numBlocks) {
    int tid = threadIdx.x;
    // Use a shared memory to reduce global memory operations
    __shared__ ulong localSum[256];
    localSum[tid] = 0;

    // Unroll the loop for better performance
    for (uint j = tid; j < numBlocks * 256; j += 256) {
        localSum[tid] += blockHistograms[j];
    }
    __syncthreads();

    // Reduce results within the block
    for (uint offset = 128; offset > 0; offset >>= 1) {
        if (tid < offset) {
            localSum[tid] += localSum[tid + offset];
        }
        __syncthreads();
    }

    // Accumulate the result back to global memory for the first thread in the block
    if (tid == 0) {
        atomicAdd(&cudaHistogram[blockIdx.x], localSum[0]);
    }
}