#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void curandINIT( int size, hiprandState_t *d_states, unsigned int seed)
{
int i = threadIdx.x + blockDim.x * blockIdx.x;
if (i < size)
{
hiprand_init(seed, i, 0, &d_states[i]);
}
}