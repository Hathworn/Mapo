#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyLog1PlusExp(float* mat, float* target, unsigned int len) {
    // Calculate global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster access to frequently used data
    __shared__ float sharedBuffer[256];

    // Load elements into shared memory
    if (idx < len) {
        sharedBuffer[threadIdx.x] = mat[idx];
    }

    __syncthreads();

    // Compute the result using shared memory
    if (idx < len) {
        float mat_i = sharedBuffer[threadIdx.x];
        if (mat_i > 0) 
            target[idx] = (__logf(1 + __expf(-mat_i)) + mat_i);
        else 
            target[idx] = __logf(1 + __expf(mat_i));
    }
}