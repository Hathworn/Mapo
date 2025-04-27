#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KCInitRNGStates(const uint32_t* gSeeds, hiprandStateMRG32k3a_t* gStates, size_t totalCount)
{
    // Calculate global thread index
    uint32_t threadId = threadIdx.x + blockDim.x * blockIdx.x;

    // Ensure threadId is within totalCount
    if(threadId < totalCount) {
        // Initialize RNG state for the current thread
        hiprand_init(gSeeds[threadId], threadId, 0, &gStates[threadId]);
    }
}
```
