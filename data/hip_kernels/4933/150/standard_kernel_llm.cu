#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void standard_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    if (tid == 0)
    {
        // Compute power outside the loop as it is independent of loop iterations
        float tmp = powf(a, 2.0f);

        // Set result to output pointer
        *out = tmp;
    }
}