#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotCudaHeapSharedMemory(const float* a, const float* b, float* dest, const size_t length) {
    // Compute unique thread ID
    size_t tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Allocate shared memory
    extern __shared__ float cache[];
    
    // Each thread computes its partial dot product
    float temp = 0.0f;
    while (tid < length) {
        temp += a[tid] * b[tid];
        tid += blockDim.x * gridDim.x;  // Stride over entire grid
    }
    
    // Store partial result in shared memory
    cache[threadIdx.x] = temp;
    
    // Synchronize threads within the block to ensure all have written to shared memory
    __syncthreads();

    // Perform reduction in shared memory
    size_t i = blockDim.x / 2;
    while (i != 0) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] += cache[threadIdx.x + i];
        }
        __syncthreads();
        i /= 2;
    }

    // Store block result in global memory
    if (threadIdx.x == 0) {
        atomicAdd(dest, cache[0]);
    }
}