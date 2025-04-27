#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardPass1(float* in, float* syn1, float* layer1)
{
    int l = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;
    int Y = 128;

    // Use a shared memory to reduce global memory accesses
    extern __shared__ float s_layer1[];
    if (threadIdx.y == 0)
        s_layer1[threadIdx.x] = 0.0f;
    __syncthreads();

    // Use atomicAdd on shared memory
    atomicAdd(&s_layer1[threadIdx.x], in[j] * syn1[j * Y + l]);
    __syncthreads();

    // Write results back to global memory
    if (threadIdx.y == 0) {
        layer1[l] = s_layer1[threadIdx.x];
        layer1[l] = 1.0f / (1.0f + exp(-layer1[l]));  // Apply sigmoid activation
    }
}