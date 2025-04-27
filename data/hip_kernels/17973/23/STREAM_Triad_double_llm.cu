#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Triad_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Calculate the linear thread index across the entire grid
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for accessing all elements
    size_t stride = blockDim.x * gridDim.x;
    for (size_t i = idx; i < len; i += stride) {
        c[i] = a[i] + scalar * b[i];
    }
}