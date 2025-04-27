#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_add(float* a, float* b, int n)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for performance improvement
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];
    
    if (i < n) {
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have written to shared memory

        // Perform addition from shared memory
        sharedA[threadIdx.x] += sharedB[threadIdx.x];
        
        // Write result back to global memory
        a[i] = sharedA[threadIdx.x];
    }
}