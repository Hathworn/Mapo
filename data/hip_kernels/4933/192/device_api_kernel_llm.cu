```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_api_kernel(hiprandState *states, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;

    // Initialize the random state for the current thread
    hiprandState localState;
    hiprand_init(9384, tid, 0, &localState);

    // Use shared state instead of recomputing state pointer
    for (int i = tid; i < N; i += nthreads)
    {
        // Generate random number and store result
        float rand = hiprand_uniform(&localState);
        rand = rand * 2.0f;
        out[i] = rand;
    }
}