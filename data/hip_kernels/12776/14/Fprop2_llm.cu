#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Fprop2(const float* layer1, const float* syn2, float* out)
{
    int i = blockDim.y * blockIdx.y + threadIdx.y;  // 10
    int j = blockIdx.x;  // Data.count

    // Use shared memory to reduce global memory accesses
    __shared__ float sharedLayer1[256];
    float x = 0.0;

    for (int k = 0; k < 256; ++k)
    {
        sharedLayer1[k] = layer1[j * 256 + k];
        __syncthreads();  // Ensure all threads have written to shared memory

        x += sharedLayer1[k] * syn2[k * 10 + i];
    }

    out[j * 10 + i] = x;
}