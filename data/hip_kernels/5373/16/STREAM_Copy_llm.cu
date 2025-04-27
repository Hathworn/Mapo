#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy(float *a, float *b, size_t len)
{
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Using strided loop for coalesced memory access
    for (; idx < len; idx += blockDim.x * gridDim.x) {
        b[idx] = a[idx];
    }
}