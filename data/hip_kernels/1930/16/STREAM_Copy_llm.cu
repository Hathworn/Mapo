#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy(float *a, float *b, size_t len)
{
    // Optimize by using a more efficient block-stride loop with grid-stride
    for (size_t idx = threadIdx.x + blockIdx.x * blockDim.x; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = a[idx];
    }
}