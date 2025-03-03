#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniDist( float *d_a, hiprandState_t *states, unsigned int size)
{
int i = threadIdx.x + blockDim.x * blockIdx.x;
if (i < size)
{
d_a[i] = hiprand_uniform(&states[i]);
}
}