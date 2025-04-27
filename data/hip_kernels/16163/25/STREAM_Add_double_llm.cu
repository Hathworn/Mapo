#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add_double(double *a, double *b, double *c, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a for loop for better readability and maintenance
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        c[idx] = a[idx] + b[idx];
    }
}