#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Unrolling loop for better performance
    #pragma unroll
    for (; i < n; i += blockDim.x * gridDim.x) {
        a[i] = a[i] + b[i];
    }
}