#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setupRandomStatesKernel(hiprandState* __restrict__ states, unsigned long long seed, int count)
{
for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < count; i += blockDim.x * gridDim.x)
{
hiprand_init(seed, i, 0, &states[i]);
}
}