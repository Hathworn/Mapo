#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_max(int *values, int *max, int *reg_maxes, int num_regions, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        int region = i % num_regions;
        int val = values[i];
        // Use atomic operation only once for performance
        int old_max = atomicMax(&reg_maxes[region], val);
        if (val > old_max)
        {
            atomicMax(max, val);
        }
    }
}