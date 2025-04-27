#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void standard_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    if(tid == 0)
    {
        // Calculate powf once outside the loop since it's independent of i
        float tmp = powf(a, 2.0f);

        // Replace loop with a single assignment as all iterations do the same task
        *out = tmp;
    }
}