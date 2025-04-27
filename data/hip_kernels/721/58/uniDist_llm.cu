#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniDist(float *d_a, hiprandState_t *states, unsigned int size)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    // Use grid-stride loop to handle more elements per thread and improve occupancy
    for (; i < size; i += blockDim.x * gridDim.x)
    {
        d_a[i] = hiprand_uniform(&states[i]);
    }
}