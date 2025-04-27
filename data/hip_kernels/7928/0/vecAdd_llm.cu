#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len)
{
    // Compute the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional assignment to determine if the thread should perform the addition
    if (i < len)
    {
        out[i] = in1[i] + in2[i];
    }
}