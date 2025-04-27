#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencilReadOnly1(float *src, float *dst, int size, int raio, float* stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x + raio + 1;
    if (idx >= size)
        return;

    float out = 0.0f;
    // Using unrolled loop for pipelining and reduced loop overhead
    #pragma unroll
    for(int i = -raio; i < raio; i++) {
        out += src[idx+i] * stencilWeight[i+raio];
    }
    dst[idx] = out;
}