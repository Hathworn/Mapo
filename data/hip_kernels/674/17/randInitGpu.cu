#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void	randInitGpu (hiprandState_t * state, const uint seed, const uint rank, const uint size)
{
uint bIdx = blockIdx.x + gridDim.x*blockIdx.y;
uint idx  = threadIdx.x + blockDim.x*bIdx;

hiprand_init (seed*gridDim.x*gridDim.y + rank*size*gridDim.x*gridDim.y + bIdx, threadIdx.x, 0, &state[idx]);
}