#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilConst1(float *src, float *dst, int size, int raio)
{
    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    idx += raio + 1;
    
    // Check if index is within bounds
    if (idx >= size)
        return;
    
    float out = 0.0f;

    // Loop unrolling for performance
    #pragma unroll
    for(int i = -raio; i < raio; i++)
    {
        // Optimize memory access by local variable
        float weight = const_stencilWeight[i + raio];
        out += src[idx + i] * weight;
    }
    
    // Store result in destination array
    dst[idx] = out;
}