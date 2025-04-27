#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(unsigned int seed, hiprandState_t *states, unsigned int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size)
    {
        // Utilize registers for seed calculation
        hiprandState_t localState;
        hiprand_init(seed, i, 0, &localState);
        states[i] = localState;
    }
}