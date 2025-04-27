#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void foo() {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global thread ID
    __shared__ float sharedPow;                       // Use shared memory
    if (tid == 0) {                                   // Only the first thread computes the shared pow
        sharedPow = pow(2, 32);
    }
    __syncthreads();                                  // Ensure the shared value is loaded

    for (int i = 0; i < 1000; i++) {
        float result = sharedPow;                     // Use precomputed result from shared memory
    }
}