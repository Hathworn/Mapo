#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeHistogram64Kernel(float *d_Histogram, float *d_PartialHistograms, uint histogramCount) {
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];

    uint sum = 0;

    // Accumulate partial histograms by each thread
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE) {
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM64_BIN_COUNT];
    }

    data[threadIdx.x] = sum;
    __syncthreads(); // Ensure all threads have written to shared memory

    // Perform parallel reduction in shared memory
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
        __syncthreads(); // Synchronize to ensure all reads in this stride are complete
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        d_Histogram[blockIdx.x] = data[0];
    }
}