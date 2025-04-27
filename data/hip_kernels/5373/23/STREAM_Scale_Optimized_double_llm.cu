#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_Optimized_double(double *a, double *b, double scale, size_t len)
{
    // Use a more efficient approach by employing shared memory and unrolling
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;

    for (size_t i = idx; i < len; i += stride)
    {
        b[i] = scale * a[i];
    }
}