#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void norm2_strided_float(int n, int xOffset, float *dx, int incx, float result) {
    // Using shared memory to reduce global memory accesses
    extern __shared__ float cache[];
    float temp_result = 0.0f;

    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        if (i >= xOffset && i % incx == 0) {
            temp_result += dx[i] * dx[i];
        }
    }

    // Store result into shared memory
    cache[threadIdx.x] = temp_result;

    // Synchronize threads within block
    __syncthreads();

    // Reduction in shared memory
    int i = blockDim.x / 2;
    while(i != 0) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] += cache[threadIdx.x + i];
        }
        __syncthreads();
        i /= 2;
    }

    // First thread of each block adds result to global memory
    if (threadIdx.x == 0) {
        atomicAdd(&result, cache[0]);
    }
}