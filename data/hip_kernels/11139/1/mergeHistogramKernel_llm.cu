#include "hip/hip_runtime.h"
#include "includes.h"

#define TAG_MASK 0xFFFFFFFFU

__global__ void mergeHistogramKernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount) {
    uint sum = 0;

    // Using threadIdx.x to handle multiple bins in a single thread iteration
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE) {
        sum += d_PartialHistograms[blockIdx.x * HISTOGRAM_BIN_COUNT + i];
    }

    // Declare shared memory for inter-thread communication
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];
    data[threadIdx.x] = sum;

    // Efficient reduction using shared memory
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1) {
        __syncthreads(); // Ensure all partial sums are ready

        if (threadIdx.x < stride) {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
    }

    // Final result stored by thread zero
    if (threadIdx.x == 0) {
        d_Histogram[blockIdx.x] = data[0];
    }
}