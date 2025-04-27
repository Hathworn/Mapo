#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeHistogram256Kernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount)
{
    // Initialize sum with 0
    uint sum = 0;

    // Accumulate partial histograms
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE)
    {
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM256_BIN_COUNT];
    }

    // Allocate shared memory
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];
    data[threadIdx.x] = sum;

    // Perform parallel reduction
    __syncthreads(); // Reduce synchronization overhead by having a single barrier
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
        __syncthreads(); // Ensure all updates to shared data are visible
    }

    // Write the result of this thread block to d_Histogram
    if (threadIdx.x == 0)
    {
        d_Histogram[blockIdx.x] = data[0];
    }
}