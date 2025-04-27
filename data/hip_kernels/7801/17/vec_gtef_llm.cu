#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void vec_gtef(size_t n, float *result, float *x, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling to handle large arrays efficiently
    for (int i = id; i < n; i += stride)
    {
        result[i] = (x[i] >= y[i]) ? 1.0f : 0.0f;
    }
}