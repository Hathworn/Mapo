#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilShared2(float *src, float *dst, int size, int raio)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float buffer[1024 + 21];

    // Load data into shared memory with bounds checking
    for (int i = threadIdx.x; i < 1024 + 21; i += blockDim.x)
    {
        int globalIdx = idx + i - raio;
        // Ensure global index is within bounds
        if (globalIdx >= 0 && globalIdx < size)
        {
            buffer[i] = src[globalIdx];
        }
        else
        {
            buffer[i] = 0.0f; // Handle out-of-bound reads
        }
    }

    __syncthreads();

    if (idx < size)
    {
        float out = 0.0f;
        #pragma unroll
        for (int i = -raio; i < raio; i++)
        {
            out += buffer[threadIdx.x + raio + i] * const_stencilWeight[i + raio];
        }

        dst[idx] = out;
    }
}