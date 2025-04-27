#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setGroupsPointersDead(multipassConfig_t* mbk, unsigned numBuckets)
{
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for improved performance (considered if appropriate)
    // __shared__ int sharedData[NUM_BUCKETS];
    
    // Check if the index is within bounds
    if(index < numBuckets) 
    {
        // Directly assign in global memory
        mbk->isNextDeads[index] = 1;
    }
}