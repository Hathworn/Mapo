#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale_Optimized(float *a, float *b, float scale, size_t len)
{
    // Calculate global thread index and avoid out-of-bounds using early return
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx >= len) return;

    // Perform scaling operation
    b[idx] = scale * a[idx];
}