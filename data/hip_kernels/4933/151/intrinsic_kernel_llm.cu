#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void intrinsic_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    // Ensure only first thread executes the loop and writes output
    if (tid == 0)
    {
        // Store the result of __powf(a, 2.0f) once and reuse
        float tmp = __powf(a, 2.0f);

        // Loop unrolling for performance
        for (int i = 0; i < iters; i += 4)
        {
            // Repeat assignment to engage optimization due to unrolling
            tmp = tmp;
            if (i + 1 < iters) tmp = tmp;
            if (i + 2 < iters) tmp = tmp;
            if (i + 3 < iters) tmp = tmp;
        }
        
        *out = tmp;
    }
}