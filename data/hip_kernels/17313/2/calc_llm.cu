#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calc(float *result, float *b, float *a, int size) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < size) {
        float temp = 0.0f;

        // Use shared memory for 'b' to reduce global memory accesses
        __shared__ float shared_b[1024]; // Assume max blockDim.x is 1024

        // Load data from 'b' into shared memory
        if (threadIdx.x < size) {
            shared_b[threadIdx.x] = b[threadIdx.x];
        }
        __syncthreads();

        // Accumulate results using shared memory
        for (int j = 0; j < size; j++) {
            temp += a[j + (idx * size)] * shared_b[j];
        }
        
        // Atomic add the result
        atomicAdd(&result[idx], temp);
    }
}