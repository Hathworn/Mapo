#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeHistogram64Kernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount)
{
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];

    uint sum = 0;

    // Unrolling loop for performance improvement
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE * 2)
    {
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM64_BIN_COUNT];
        if (i + MERGE_THREADBLOCK_SIZE < histogramCount)
        {
            sum += d_PartialHistograms[blockIdx.x + (i + MERGE_THREADBLOCK_SIZE) * HISTOGRAM64_BIN_COUNT];
        }
    }

    data[threadIdx.x] = sum;

    // Optimized parallel reduction
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (threadIdx.x < stride)
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
    }

    if (threadIdx.x == 0)
    {
        d_Histogram[blockIdx.x] = data[0];
    }
}