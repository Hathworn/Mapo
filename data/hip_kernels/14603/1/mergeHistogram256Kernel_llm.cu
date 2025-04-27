#include "hip/hip_runtime.h"
#include "includes.h"

#define TAG_MASK 0xFFFFFFFFU

__global__ void mergeHistogram256Kernel(uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount)
{
    // Calculate global thread index for processing
    uint globalThreadIdx = blockIdx.x * blockDim.x + threadIdx.x;
    uint sum = 0;

    // Accumulate histogram values for this thread
    for (uint i = globalThreadIdx; i < histogramCount * HISTOGRAM256_BIN_COUNT; i += gridDim.x * blockDim.x)
    {
        sum += d_PartialHistograms[i];
    }

    // Use shared memory for reduction within the block
    extern __shared__ uint data[];
    data[threadIdx.x] = sum;
    __syncthreads();

    // Efficient parallel reduction
    for (uint stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
    {
        d_Histogram[blockIdx.x] = data[0];
    }
}