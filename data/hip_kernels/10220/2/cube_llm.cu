#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cube(float * d_out, float * d_in)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global thread ID
    float num = d_in[id];
    d_out[id] = num * num * num; // Compute cube and store in output
}