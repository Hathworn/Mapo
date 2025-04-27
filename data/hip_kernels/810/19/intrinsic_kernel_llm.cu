#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intrinsic_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    if(tid == 0)
    {
        // Reduce register usage by moving tmp declaration outside the loop
        float tmp = __powf(a, 2.0f);

        // Remove unnecessary repetitive computation in loop
        for (int i = 1; i < iters; i++) { }

        *out = tmp;
    }
}