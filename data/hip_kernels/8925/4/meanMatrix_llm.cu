#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void meanMatrix(double *dMatrix, double *dMean, int dSize, int *d_mutex) {
    __shared__ double cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;
    double temp = 0;

    // Optimize loop increment for better performance
    for (int i = tid; i < dSize; i += blockDim.x * gridDim.x) {
        temp += dMatrix[i];
    }

    // Store temporary sum in shared memory
    cache[cacheIndex] = temp;
    __syncthreads();

    // Reduce within block using shared memory
    for (int i = blockDim.x / 2; i > 0; i /= 2) {
        if (cacheIndex < i) {
            cache[cacheIndex] += cache[cacheIndex + i];
        }
        __syncthreads();
    }

    // Atomic add with mutex lock on cache[0] result
    if (cacheIndex == 0) {
        while (atomicCAS(d_mutex, 0, 1) != 0); // lock
        atomicAdd(dMean, cache[0]);
        atomicExch(d_mutex, 0); // unlock
    }

    // Ensure mean division is complete outside the atomic operation
    if (tid == 0) {
        *dMean = *dMean / dSize;
    }
}