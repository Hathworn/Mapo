#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setGroupsPointersDead(multipassConfig_t* mbk, unsigned numBuckets)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Use block and thread indices for better parallelism
    if(index < numBuckets)
    {
        mbk->isNextDeads[index] = 1; // Direct assignment without unnecessary operations
    }
}