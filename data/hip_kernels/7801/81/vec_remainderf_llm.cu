#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to compute the remainder of floating point division
__global__ void vec_remainderf(size_t n, float *result, const float *x, const float *y)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure each thread processes only valid elements
    if (id < n)
    {
        result[id] = remainderf(x[id], y[id]); // Efficient single operation per thread
    }
}