```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_api_kernel(hiprandState *states, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;
    
    if (tid >= N) return;  // Exit if tid is out of bounds

    hiprandState localState;
    hiprand_init(9384, tid, 0, &localState);  // Use a local state variable

    for (int i = tid; i < N; i += nthreads)
    {
        float rand = hiprand_uniform(&localState);  // Use local state for generating random numbers
        rand = rand * 2;
        out[i] = rand;
    }
}