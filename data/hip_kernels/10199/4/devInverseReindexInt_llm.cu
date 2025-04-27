#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize parallelism for better occupancy and performance
__global__ void devInverseReindexInt(int N, int *destArray, int *srcArray, int *reindex, int realSize, int nDims)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop to reduce overhead and improve memory access
    #pragma unroll
    for (unsigned int n = 0; n < nDims; n++) {
        if (i < N) {
            int tmp = srcArray[i + n * realSize];
            destArray[i + n * realSize] = reindex[tmp];
        }
        i += gridDim.x * blockDim.x;
    }
}