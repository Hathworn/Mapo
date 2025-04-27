#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

// Updates the column norms by subtracting the Hadamard-square of the
// Householder vector.
//
// N.B.:  Overflow incurred in computing the square should already have
// been detected in the original norm construction.

__global__ void gpuFindMax(int n, float *data, int threadWorkLoad, int *maxIndex)
{
    int start = threadWorkLoad * threadIdx.x;
    int end = start + threadWorkLoad;

    // Shared memory for maximum indices per thread
    __shared__ int maxIndices[NTHREADS];
    maxIndices[threadIdx.x] = -1;

    // Check if start is out of bounds
    if (start >= n) return;

    // Initialize local max index
    int localMaxIndex = start;
    
    // Find local maximum index within thread's workload
    for (int i = start + 1; i < end && i < n; i++) {
        if (data[i] > data[localMaxIndex]) {
            localMaxIndex = i;
        }
    }
    maxIndices[threadIdx.x] = localMaxIndex;
    __syncthreads();

    // Reduce to find the maximum index in the block
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            int j = maxIndices[threadIdx.x];
            int k = maxIndices[threadIdx.x + offset];
            if (data[j] < data[k]) {
                maxIndices[threadIdx.x] = k;
            }
        }
        __syncthreads();
    }

    // Write the result for the block
    if (threadIdx.x == 0) {
        *maxIndex = maxIndices[0];
    }
}