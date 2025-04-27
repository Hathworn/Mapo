#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilConst2(float *src, float *dst, int size, int raio)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    idx += raio + 1;
    if (idx >= size)
        return;
    
    float out = 0;
    // Use shared memory for stencil weights to reduce global memory accesses
    __shared__ float shared_stencilWeight[2 * raio];
    if (threadIdx.x < 2 * raio) {
        shared_stencilWeight[threadIdx.x] = const_stencilWeight[threadIdx.x];
    }
    __syncthreads();

    // Calculate stencil with unrolled loop and shared memory
    #pragma unroll
    for (int i = -raio; i < raio; i++) {
        out += src[idx + i] * shared_stencilWeight[i + raio];
    }
    dst[idx] = out;
}