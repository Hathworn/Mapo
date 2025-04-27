#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Scale(float *a, float *b, float scale, size_t len)
{
    // Calculate the unique global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilize grid-stride loop for processing elements
    for (size_t i = idx; i < len; i += blockDim.x * gridDim.x) {
        b[i] = scale * a[i];
    }
}