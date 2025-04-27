#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilReadOnly3(float *src, float *dst, int size, int raio, float* stencilWeight)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    idx += raio+1;
    if (idx >= size)
        return;

    float out = 0.0f;

    // Prefetch stencil weights to shared memory for faster access
    __shared__ float sharedStencilWeight[256];  // Adjust size as needed
    if (threadIdx.x < 2 * raio) {
        sharedStencilWeight[threadIdx.x] = stencilWeight[threadIdx.x];
    }
    __syncthreads();

    // Use fewer registers and restrict pointer usage
    float* __restrict src_ptr = src;
    float* __restrict dst_ptr = dst;
    
    #pragma unroll
    for(int i = -raio; i < raio; i++) {
        out += src_ptr[idx + i] * sharedStencilWeight[i + raio];
    }

    dst_ptr[idx] = out;
}