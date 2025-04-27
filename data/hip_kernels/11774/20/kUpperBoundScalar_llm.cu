```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpperBoundScalar(float* mat, float val, float* target, unsigned int len) {
    // Utilize shared memory to reduce global memory access
    __shared__ float shared_val;
    
    if (threadIdx.x == 0) {
        shared_val = val;
    }

    __syncthreads(); // Ensure shared_val is updated

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use for loop with step of numThreads for strided access
    for (unsigned int i = idx; i < len; i += numThreads) {
        float matVal = mat[i]; // Cache matrix value to reduce global memory loads
        target[i] = matVal > shared_val ? shared_val : matVal;
    }
}