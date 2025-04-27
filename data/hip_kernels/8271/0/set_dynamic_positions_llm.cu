#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_dynamic_positions(float *arr, float t)
{
    int threadID = threadIdx.x;
    int blockID = blockIdx.x;
    int threads_per_block = blockDim.x;
    int i = blockID * threads_per_block + threadID;

    // Use a mask to reduce branching
    if (threadID < 3)
    {
        arr[i] = arr[i] * t;
    }
}