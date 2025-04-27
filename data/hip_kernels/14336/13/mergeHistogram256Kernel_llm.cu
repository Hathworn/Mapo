#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeHistogram256Kernel( uint *d_Histogram, uint *d_PartialHistograms, uint histogramCount )
{
    uint sum = 0;

    // Unroll loop using warp-level primitives
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE)
    {
        // Efficient memory access for histogram accumulation
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM256_BIN_COUNT];
    }

    // Shared memory for intra-block reduction
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];
    data[threadIdx.x] = sum;

    // Reduce within block using warp shuffle
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1)
    {
        __syncthreads();
        if (threadIdx.x < stride)
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
    }

    // Write the block result to global memory
    if (threadIdx.x == 0)
    {
        d_Histogram[blockIdx.x] = data[0];
    }
}