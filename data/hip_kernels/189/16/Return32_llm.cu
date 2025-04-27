#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Return32( int *sum, int *out, const int *pIn )
{
    // Load input value into register to reduce memory latency
    int inputVal = *pIn;

    // Perform atomic addition for concurrent write
    out[threadIdx.x] = atomicAdd(&sum[threadIdx.x], inputVal);
}