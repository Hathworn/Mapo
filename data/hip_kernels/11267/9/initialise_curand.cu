#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialise_curand(hiprandState * state, unsigned long seed)
{
int idx = blockIdx.x*blockDim.x + threadIdx.x;
hiprand_init(seed, idx, 0, &state[idx]);
//printf("index idx = %d", idx);
__syncthreads();
}