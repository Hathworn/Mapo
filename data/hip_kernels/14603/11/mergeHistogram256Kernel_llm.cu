#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeHistogram256Kernel(float *d_Histogram, float *d_PartialHistograms, uint histogramCount) 
{
    // Calculate partial sum using shared memory reduction
    __shared__ uint data[MERGE_THREADBLOCK_SIZE];
    
    uint sum = 0;
    for (uint i = threadIdx.x; i < histogramCount; i += MERGE_THREADBLOCK_SIZE)
    {
        sum += d_PartialHistograms[blockIdx.x + i * HISTOGRAM256_BIN_COUNT];
    }

    // Store sum in shared memory
    data[threadIdx.x] = sum;

    // Efficient reduction using shared memory
    __syncthreads();
    for (uint stride = MERGE_THREADBLOCK_SIZE / 2; stride > 0; stride >>= 1) 
    {
        if (threadIdx.x < stride) 
        {
            data[threadIdx.x] += data[threadIdx.x + stride];
        }
        __syncthreads(); // Wait for all threads before next stride
    }

    // Write result to global memory
    if (threadIdx.x == 0) 
    {
        d_Histogram[blockIdx.x] = data[0];
    }
}