#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_api_kernel(hiprandState *states, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if the index is out of bounds
    if (tid >= N) return;

    hiprandState localState;
    hiprand_init(9384, tid, 0, &localState);

    // Loop over elements with a stride of total number of threads
    for (int i = tid; i < N; i += blockDim.x * gridDim.x)
    {
        float rand = hiprand_uniform(&localState);
        rand = rand * 2;
        out[i] = rand;
    }
}