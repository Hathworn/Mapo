#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normalise(float* result, unsigned int resultLength, float* amps, unsigned int* hits)
{
    // Calculate the absolute thread index
    int absoluteThreadIdx = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index is within bounds
    if(absoluteThreadIdx >= resultLength) return;

    // Normalize using shared memory for 'hits' to enhance memory access performance
    __shared__ unsigned int sharedHits[256]; // Assumed maximum block size of 256 for illustration
    int localIdx = threadIdx.x / 4;

    if (threadIdx.x % 4 == 0) {
        sharedHits[localIdx] = hits[absoluteThreadIdx / 4];
    }
    __syncthreads();

    // Perform normalization
    result[absoluteThreadIdx] = amps[absoluteThreadIdx] / sharedHits[localIdx];
}