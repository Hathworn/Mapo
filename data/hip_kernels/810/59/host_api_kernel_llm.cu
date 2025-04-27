#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void host_api_kernel(float *randomValues, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through the range of indices this thread is responsible for, stride by nthreads
    for (int i = tid; i < N; i += gridDim.x * blockDim.x)
    {
        // Directly store the result to the output array
        out[i] = randomValues[i] * 2;
    }
}