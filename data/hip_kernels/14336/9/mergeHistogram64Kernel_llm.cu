#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeHistogram64Kernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount) 
{
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];
    uint sum = 0;

    // Accumulate partial histograms
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE) 
    {
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM64_BIN_COUNT];
    }

    data[threadIdx.x] = sum;
    __syncthreads(); // Synchronize threads before reduction

    // Optimize reduction using loop unrolling
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1) 
    {
        if (threadIdx.x < stride) 
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
        __syncthreads(); // Sync threads at the end of each stride
    }

    if (threadIdx.x == 0) 
    {
        d_Histogram[blockIdx.x] = data[0]; // Output result to global memory
    }
}