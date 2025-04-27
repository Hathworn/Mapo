#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernal()
{
    // Use warp synchronization to reduce the number of printf calls
    if (threadIdx.x % warpSize == 0) {
        printf("warp leader thread number %d\n", threadIdx.x);
    }
}