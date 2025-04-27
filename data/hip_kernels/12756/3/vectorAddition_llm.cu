#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAddition(float *a, float *b, float *c, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use shared memory for faster data access
    __shared__ float a_shared[256];
    __shared__ float b_shared[256];

    if (i < n) {
        // Ensure i is valid for shared memory index
        int local_i = threadIdx.x;
        
        // Load data into shared memory
        a_shared[local_i] = a[i];
        b_shared[local_i] = b[i];
        __syncthreads(); // Synchronize threads

        // Compute with shared memory
        c[i] = a_shared[local_i] + b_shared[local_i];
    }
}