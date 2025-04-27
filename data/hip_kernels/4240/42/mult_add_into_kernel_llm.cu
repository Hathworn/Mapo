#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate a linear index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
   
    // Use shared memory for better memory access efficiency
    __shared__ float sharedA[256];
    __shared__ float sharedB[256];

    if(i < n){
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];
        __syncthreads(); // Ensure all threads have loaded A and B
        
        // Perform operation using shared memory
        c[i] += sharedA[threadIdx.x] * sharedB[threadIdx.x];
    }
}