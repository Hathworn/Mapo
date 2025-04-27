#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setGroupsPointersDead(multipassConfig_t* mbk, unsigned numBuckets)
{
    // Use shared memory and avoid accessing global memory inside the loop
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Use block and thread indices for 1D grid

    if(index < numBuckets)
    {
        mbk->isNextDeads[index] = 1; // Efficiently setting the value directly
    }
}