#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intrinsic_kernel(float a, float *out, int iters)
{
    // Calculate thread index
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    // Only one thread performs the operation
    if(tid == 0)
    {
        // Use register to store intermediate value
        float tmp = __powf(a, 2.0f);

        // Loop unrolling
        for (int i = 1; i < iters; i += 4)
        {
            tmp = __powf(a, 2.0f);
            tmp = __powf(a, 2.0f);
            tmp = __powf(a, 2.0f);
            tmp = __powf(a, 2.0f);
        }

        // Write final value to out
        *out = tmp;
    }
}