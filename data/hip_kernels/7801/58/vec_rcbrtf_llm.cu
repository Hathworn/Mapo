#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_rcbrtf(size_t n, float *result, float *x)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure id is within bounds
    if (id < n)
    {
        // Calculate reciprocal cube root
        result[id] = rcbrtf(x[id]);
    }
}