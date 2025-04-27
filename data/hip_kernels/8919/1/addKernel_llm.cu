#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    int g_tId = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate warpId without redundant operation
    unsigned int warpId = g_tId / warpSize;

    if (g_tId < vectorSize) {
        c[g_tId] = a[g_tId] + b[g_tId];

        // Use conditional compilation to remove printf in release builds
        #ifdef DEBUG
        printf("thread id %d , warp Id %d , block id %d\n", g_tId, warpId, blockIdx.x);
        #endif
    }
}