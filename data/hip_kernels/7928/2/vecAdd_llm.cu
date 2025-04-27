#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float *in1, float *in2, float *out, int len)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread adds one element from in1 and in2 if within bounds
    if (i < len)
    {
        out[i] = in1[i] + in2[i];
    }
}