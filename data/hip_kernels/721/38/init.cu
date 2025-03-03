#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void init( unsigned int seed, hiprandState_t *d_state)
{
hiprand_init(
seed,
threadIdx.x + blockDim.x * blockIdx.x,
0,
&d_state[threadIdx.x + blockDim.x * blockIdx.x]);
}