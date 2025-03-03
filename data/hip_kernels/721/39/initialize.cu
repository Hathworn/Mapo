#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initialize( unsigned int seed, hiprandState_t *states, unsigned int size)
{
int i = threadIdx.x + blockDim.x * blockIdx.x;
if (i < size)
{
hiprand_init(
seed,
i,
0,
&states[i]);
}
}