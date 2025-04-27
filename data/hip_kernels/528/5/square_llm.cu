#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(float * d_out, float * d_in)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index for threads
    float f = d_in[idx];
    d_out[idx] = f * f; // Square the input value and store in output
}