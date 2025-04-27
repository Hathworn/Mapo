#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float f(float x)
{
    return 4.f / (1.f + x * x);
}

__global__ void calcIntegralGPU(float *array, const float h, const long stepCount, const int threads, const int blocks)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    __shared__ float shared_data[256]; // Assuming max 256 threads per block
    shared_data[threadIdx.x] = 0.0f;

    for (int i = idx; i < stepCount; i += threads * blocks)
    {
        float x = (i + 0.5f) * h;
        shared_data[threadIdx.x] += f(x);
    }

    // Accumulate shared memory results into global memory
    __syncthreads(); // Ensure all threads in the block have written to shared memory

    // Simple parallel reduction within the block
    if (threadIdx.x == 0) 
    {
        float blockSum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i)
        {
            blockSum += shared_data[i];
        }
        atomicAdd(&array[idx], blockSum); // Using atomic operation to avoid race conditions
    }
}