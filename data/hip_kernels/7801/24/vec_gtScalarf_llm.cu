#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_gtScalarf (size_t n, float *result, float *x, float y)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Prefetch the value into a register to reduce memory access
    if (id < n)
    {
        float x_val = x[id];
        result[id] = (x_val > y) ? 1.0f : 0.0f;
    }
}