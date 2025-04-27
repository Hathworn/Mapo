#include "hip/hip_runtime.h"
#include "includes.h"

//=== Vector math (two arguments) ============================================

__global__ void vec_fmodf(size_t n, float *result, float *x, float *y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Improved with loop unrolling for better performance
    for (; id < n; id += gridDim.x * blockDim.x)
    {
        result[id] = fmodf(x[id], y[id]);
    }
}