#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setGroupsPointersDead(multipassConfig_t* mbk, unsigned numBuckets)
{
    // Use blockIdx and blockDim for parallel execution
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index < numBuckets)
    {
        mbk->isNextDeads[index] = 1;
    }
}