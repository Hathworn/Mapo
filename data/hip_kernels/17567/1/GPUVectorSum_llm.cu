#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPUVectorSum(int * a, int * b, int * c, int VECTOR_QNT) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Pre-fetching to utilize shared memory for faster access
    extern __shared__ int sharedA[];

    // Load elements collaboratively
    if (idx < VECTOR_QNT) {
        sharedA[threadIdx.x] = a[idx];
        __syncthreads();  // Ensure all threads have loaded data
        
        // Perform addition with shared memory
        c[idx] = sharedA[threadIdx.x] + b[idx];
    }
}