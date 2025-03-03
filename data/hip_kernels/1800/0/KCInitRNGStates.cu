#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void KCInitRNGStates(const uint32_t* gSeeds, hiprandStateMRG32k3a_t* gStates, size_t totalCount)
{
for(uint32_t threadId = threadIdx.x + blockDim.x * blockIdx.x;
threadId < totalCount;
threadId += (blockDim.x * gridDim.x))
{
hiprand_init(gSeeds[threadId], threadId, 0, &gStates[threadId]);
}
}