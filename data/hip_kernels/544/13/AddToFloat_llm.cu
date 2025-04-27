#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AddToFloat(float* sum, float* out, const float* pIn)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    (void)atomicAdd(&out[idx], pIn[idx]); // Use global thread index for memory access
}