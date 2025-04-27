#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void STREAM_Scale_double(double *a, double *b, double scale, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure idx is within the bounds of the array
    if (idx < len) {
        b[idx] = scale * a[idx];

        // Unrolling loop to improve memory access patterns
        size_t stride = blockDim.x * gridDim.x;
        for (idx += stride; idx < len; idx += stride) {
            b[idx] = scale * a[idx];
        }
    }
}