#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float* __restrict__ a, float* __restrict__ b, float* __restrict__ c, const int N)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better performance
    if(i < N) c[i] = a[i] + b[i];
    if(i + blockDim.x < N) c[i + blockDim.x] = a[i + blockDim.x] + b[i + blockDim.x];
}