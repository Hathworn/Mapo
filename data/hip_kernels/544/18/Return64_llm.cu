#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Return64(unsigned long long *sum, unsigned long long *out, const unsigned long long *pIn)
{
    // Optimize by reducing atomic operation scope to minimal required index
    unsigned int idx = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned long long val = (idx < blockDim.x) ? *pIn : 0; // Ensure valid read within bounds
    out[idx] = atomicAdd(&sum[idx], val); // Perform atomicAdd only if `idx` is valid
}