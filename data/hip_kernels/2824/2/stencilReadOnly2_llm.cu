#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilReadOnly2(float *src, float *dst, int size, int raio, float* stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Adjust index to account for boundary
    idx += raio + 1;
    if (idx >= size)
        return;
    
    // Declare shared memory for stencil weights
    __shared__ float sharedStencilWeight[1024];
    
    // Cache stencil weights to shared memory
    if (threadIdx.x < (2 * raio))
        sharedStencilWeight[threadIdx.x] = stencilWeight[threadIdx.x];

    // Synchronize to ensure all threads have loaded stencil weights
    __syncthreads();

    float out = 0;
    #pragma unroll
    // Use shared memory for stencil weights
    for (int i = -raio; i < raio; i++)
    {
        out += src[idx + i] * sharedStencilWeight[i + raio];
    }
    dst[idx] = out;
}