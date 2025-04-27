#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void host_api_kernel(float *randomValues, float *out, int N)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;

    // Loop with stride equal to total number of threads
    for (int i = tid; i < N; i += nthreads)
    {
        // Load, process and store in out array
        out[i] = randomValues[i] * 2.0f;
    }
}