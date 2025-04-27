```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_double(double *a, double *b, double scale, size_t len)
{
    // Calculate global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Using a stride loop to ensure all elements are processed
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        b[i] = scale * a[i];
    }
}