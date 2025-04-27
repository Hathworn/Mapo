#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
#ifndef __HIPCC__
#define __HIPCC__
#endif

#define imin(a, b) (a < b ? a : b)

const int N = 33 * 1024;
const int threadsPerBlock = 256;
const int blocksPerGrid = imin(32, (N + threadsPerBlock - 1) / threadsPerBlock);

__global__ void dot(float *a, float *b, float *c)
{
    __shared__ float cache[threadsPerBlock];
    int threadID = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheID = threadIdx.x;
    float temp = 0;

    // Loop unrolling for better performance
    int stepSize = blockDim.x * gridDim.x;
    while (threadID < N) {
        temp += a[threadID] * b[threadID];
        if (threadID + blockDim.x < N) {
            temp += a[threadID + blockDim.x] * b[threadID + blockDim.x];
        }
        if (threadID + 2 * blockDim.x < N) {
            temp += a[threadID + 2 * blockDim.x] * b[threadID + 2 * blockDim.x];
        }
        if (threadID + 3 * blockDim.x < N) {
            temp += a[threadID + 3 * blockDim.x] * b[threadID + 3 * blockDim.x];
        }
        threadID += 4 * stepSize;
    }

    cache[cacheID] = temp;
    __syncthreads();

    // Parallel reduction using loop unrolling
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (cacheID < i) {
            cache[cacheID] += cache[cacheID + i];
        }
        __syncthreads();
    }

    if (cacheID == 0) {
        c[blockIdx.x] = cache[0];
    }
}