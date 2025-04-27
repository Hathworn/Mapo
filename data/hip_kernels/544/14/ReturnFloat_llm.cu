#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReturnFloat(float *sum, float *out, const float *pIn)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    atomicAdd(&out[idx], pIn[idx]);  // Optimize index calculation and atomicAdd
}