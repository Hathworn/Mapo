#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void uniformRandom( hiprandState_t *states, float *d_values)
{
int tid = threadIdx.x + blockDim.x * blockIdx.x;
d_values[tid] = hiprand_uniform(&states[tid]);
}