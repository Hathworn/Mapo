#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void host_api_kernel(float *randomValues, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single loop iteration with stride of totalThreads
    for (int i = tid; i < N; i += gridDim.x * blockDim.x)
    {
        float rand = randomValues[i];
        rand = rand * 2;
        out[i] = rand;
    }
}