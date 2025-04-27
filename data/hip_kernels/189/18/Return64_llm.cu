#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Return64( unsigned long long *sum, unsigned long long *out, const unsigned long long *pIn )
{
    // Use blockIdx.x to handle more than one block
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform atomic addition safely across various threads within a block
    out[index] = atomicAdd(&sum[index], *pIn);
}