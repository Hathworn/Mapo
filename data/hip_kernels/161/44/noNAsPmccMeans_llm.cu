#include "hip/hip_runtime.h"
#include "includes.h"
#define FALSE 0
#define TRUE !FALSE

#define NUMTHREADS 16
#define THREADWORK 32

__global__ void noNAsPmccMeans(int nRows, int nCols, float * a, float * means)
{
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    if (col >= nCols) return; // Early exit if beyond column range

    int inOffset = col * nRows;
    float sum = 0.f;
    
    // Load data into shared memory for coalesced access
    __shared__ float threadSums[NUMTHREADS];
    
    for (int i = threadIdx.y; i < nRows; i += blockDim.y)
    {
        sum += a[inOffset + i];
    }

    threadSums[threadIdx.y] = sum; // Write per-thread sum to shared memory
    __syncthreads();

    // Reduce sum within block
    for (int stride = blockDim.y >> 1; stride > 0; stride >>= 1) {
        if (threadIdx.y < stride) {
            threadSums[threadIdx.y] += threadSums[threadIdx.y + stride];
        }
        __syncthreads();
    }
    
    // Write final result from block to global memory
    if (threadIdx.y == 0)
        means[col] = threadSums[0] / (float)nRows;
}