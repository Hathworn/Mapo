#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void register_usage_test(int * results, int size)
{
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Combined redundant variables into one calculation
    int x4 = (3465 * 2) + (1768 * 2) + (453 * 2);

    if (gid < size)
    {
        results[gid] = x4;
    }
}