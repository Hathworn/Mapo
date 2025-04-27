#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_dynamic_position(float *arr, float t)
{
    int threadID = threadIdx.x;
    int blockID = blockIdx.x;
    int threads_per_block = blockDim.x;
    int i = blockID * threads_per_block + threadID;

    // Use shared memory to reduce global memory access
    __shared__ float sharedArr[3];
    if (threadID < 3)
    {
        sharedArr[threadID] = arr[i] * t;
        arr[i] = sharedArr[threadID];
    }
}