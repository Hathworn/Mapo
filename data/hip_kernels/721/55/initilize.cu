#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initilize( unsigned int seed, hiprandState_t *states)
{
int tid = threadIdx.x + blockDim.x * blockIdx.x;
hiprand_init(
seed,
tid,
0,
&states[tid]);
}