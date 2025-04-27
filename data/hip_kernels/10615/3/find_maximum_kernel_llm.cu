#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_maximum_kernel(float *array, int *mutex, unsigned int n, int blockSize) {
    unsigned int index = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x;
    unsigned int offset = 0;

    extern __shared__ float cache[];

    float temp = -1.0;
    while (index + offset < n) {
        temp = fmaxf(temp, array[index + offset]);
        offset += stride;
    }

    cache[threadIdx.x] = temp;
    __syncthreads();

    // Optimized reduction using warp reduction technique
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            cache[threadIdx.x] = fmaxf(cache[threadIdx.x], cache[threadIdx.x + s]);
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        while (atomicCAS(mutex, 0, 1) != 0);  // lock
        maxLum = fmaxf(maxLum, cache[0]);
        atomicExch(mutex, 0);  // unlock
    }
}