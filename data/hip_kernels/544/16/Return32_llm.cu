#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Return32( int *sum, int *out, const int *pIn )
{
    // Calculate a unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use idx rather than threadIdx.x for better scalability
    out[idx] = atomicAdd(&sum[idx], *pIn);
}