#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_Optimized_double(double *a, double *b, double scale, size_t len)
{
    // Calculate global thread index once using optimized expression.
    size_t idx = (blockDim.x * blockIdx.x) + threadIdx.x;

    // Use a loop to process multiple elements per thread for better occupancy.
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = scale * a[idx];
    }
}