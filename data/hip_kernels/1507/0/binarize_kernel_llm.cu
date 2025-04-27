#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Use blockIdx.z for additional parallelism
    int i = (blockIdx.x + blockIdx.y*gridDim.x + blockIdx.z*gridDim.x*gridDim.y) * blockDim.x + threadIdx.x;
    // Protect memory access with boundary check
    if (i < n) {
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f;
    }
}