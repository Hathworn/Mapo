#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernel4(float *data1, float *data2)
{
    float t = 0.0f;
    float c = 0.0f;
    int index = NX * blockIdx.x + threadIdx.x;
    
    // Use shared memory for efficient data access
    extern __shared__ float sharedData[];
    sharedData[threadIdx.x] = data1[index];
    __syncthreads();

    if (threadIdx.x > 0)
    {
        t += sharedData[threadIdx.x - 1] - sharedData[threadIdx.x];
        c += 1.0f;
    }
    if (threadIdx.x < blockDim.x - 1)
    {
        t += sharedData[threadIdx.x + 1] - sharedData[threadIdx.x];
        c += 1.0f;
    }
    if (blockIdx.x > 0)
    {
        int prevBlockIndex = NX * (blockIdx.x - 1) + threadIdx.x;
        t += data1[prevBlockIndex] - sharedData[threadIdx.x];
        c += 1.0f;
    }
    if (blockIdx.x < gridDim.x - 1)
    {
        int nextBlockIndex = NX * (blockIdx.x + 1) + threadIdx.x;
        t += data1[nextBlockIndex] - sharedData[threadIdx.x];
        c += 1.0f;
    }

    if (blockIdx.x == 0)
        data2[index] = 1.0f;
    else
        data2[index] = data1[index] + t / c * DIFF_RATE;
}