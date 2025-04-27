#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void gpuFindMax(int n, float *data, int threadWorkLoad, int *maxIndex)
{
    int j, k;
    int start = threadWorkLoad * threadIdx.x;
    int end = min(start + threadWorkLoad, n); // Reduce redundant checks
    __shared__ int maxIndices[NTHREADS];

    maxIndices[threadIdx.x] = -1;

    if(start >= n)
        return;

    int localMaxIndex = start;
    for (int i = start + 1; i < end; i++) {
        if (data[i] > data[localMaxIndex])
            localMaxIndex = i;
    }
    maxIndices[threadIdx.x] = localMaxIndex;
    __syncthreads();

    // Optimize reduction with unrolling
    for (int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            j = maxIndices[threadIdx.x];
            k = maxIndices[i + threadIdx.x];
            if ((j != -1) && (k != -1) && (data[j] < data[k]))
                maxIndices[threadIdx.x] = k;
        }
        __syncthreads();
    }
    if (threadIdx.x == 0) {
        *maxIndex = maxIndices[0];
    }
}