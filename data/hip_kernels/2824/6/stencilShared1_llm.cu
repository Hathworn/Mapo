#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencilShared1(float *src, float *dst, int size, int raio)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ float buffer[1024 + 21]; // Allocate shared memory with correct size

    // Load data into shared memory with necessary offset handling
    int sharedIndex = threadIdx.x;
    while (sharedIndex < 1024 + 21) {
        int sourceIndex = idx + sharedIndex;
        if (sourceIndex < size) {
            buffer[sharedIndex] = src[sourceIndex];
        }
        sharedIndex += blockDim.x;
    }

    __syncthreads(); // Ensure all threads have loaded their data

    idx += raio + 1;
    if (idx < size) {
        float out = 0.0f;

        #pragma unroll
        for (int i = -raio; i <= raio; i++) {
            out += buffer[threadIdx.x + raio + i] * const_stencilWeight[i + raio];
        }

        dst[idx] = out; // Write result to global memory
    }
}