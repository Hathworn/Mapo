#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histogram(unsigned int *input, unsigned int *bins, unsigned int num_elements, unsigned int num_bins) {

    // Use shared memory for thread-private histograms
    __shared__ unsigned int hist[NUM_BINS];

    int threadId = threadIdx.x;
    int globalId = blockDim.x * blockIdx.x + threadIdx.x;
    int elementsPerThread = (num_bins + blockDim.x - 1) / blockDim.x; // Adjust for efficient memory use

    // Initialize histogram bins to zero
    for (int j = 0; j < elementsPerThread; ++j) {
        int histIdx = threadId + j * blockDim.x;
        if (histIdx < num_bins) {
            hist[histIdx] = 0;
        }
    }
    __syncthreads();

    // Build histogram privately in shared memory
    if (globalId < num_elements) {
        atomicAdd(&hist[input[globalId]], 1);
    }
    __syncthreads();

    // Combine private histograms into final global histogram
    for (int k = 0; k < elementsPerThread; ++k) {
        int binIdx = threadId + k * blockDim.x;
        if (binIdx < num_bins) {
            atomicAdd(&bins[binIdx], hist[binIdx]);
        }
    }
}