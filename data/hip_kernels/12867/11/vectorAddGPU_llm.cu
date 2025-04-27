#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddGPU(float *a, float *b, float *c, int N)
{
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process each item assigned to this thread
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}