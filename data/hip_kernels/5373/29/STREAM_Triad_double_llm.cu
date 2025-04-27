#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Triad_double(double *a, double *b, double *c, double scalar, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x; // Define stride outside the loop
    for (; idx < len; idx += stride) { // Use a for loop for clarity
        c[idx] = a[idx] + scalar * b[idx];
    }
}