#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void host_api_kernel(float *randomValues, float *out, int N)
{
    // Get thread index with minor optimization using block-wide stride
    int tid = (blockIdx.x * blockDim.x + threadIdx.x);
    int stride = blockDim.x * gridDim.x; // Calculate total stride

    for (int i = tid; i < N; i += stride)
    {
        float rand = randomValues[i];
        rand = rand * 2;
        out[i] = rand;
    }
}