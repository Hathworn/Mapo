#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Triad_double(double *a, double *b, double *c, double scalar, size_t len)
{
    // Calculate the global thread ID
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to handle larger arrays and ensure all threads are utilized
    size_t stride = blockDim.x * gridDim.x;

    // Loop through elements that each thread will process
    for (; idx < len; idx += stride) {
        c[idx] = a[idx] + scalar * b[idx];
    }
}