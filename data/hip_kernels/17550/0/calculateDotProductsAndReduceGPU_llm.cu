```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define _USE_MATH_DEFINES

__global__ void calculateDotProductsAndReduceGPU(int *vec1, int *vec2, int *reduced, int numElements)
{
    extern __shared__ int sdata[];

    int tid = threadIdx.x;
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int numThreads = blockDim.x;

    // Initialize shared memory only if index is within range.
    if (i < numElements) {
        sdata[tid] = vec1[i] * vec2[i];
        sdata[tid + numThreads] = vec1[i] * vec1[i];
        sdata[tid + (numThreads * 2)] = vec2[i] * vec2[i];
    } else {
        sdata[tid] = 0;
        sdata[tid + numThreads] = 0;
        sdata[tid + (numThreads * 2)] = 0;
    }
    __syncthreads();

    // Optimize reduction using sequential addressing with reversed loop.
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
            sdata[tid + numThreads] += sdata[tid + numThreads + s];
            sdata[tid + (numThreads * 2)] += sdata[(tid + (numThreads * 2)) + s];
        }
        __syncthreads();
    }

    // Use atomic adds to update the reduced arrays.
    if (tid == 0) {
        atomicAdd(&reduced[0], sdata[tid]);
        atomicAdd(&reduced[1], sdata[tid + numThreads]);
        atomicAdd(&reduced[2], sdata[tid + (numThreads * 2)]);
    }
}