#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory for reduction
extern "C"
__global__ void accrue(int n, float *a, float *b, float p, float *result)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for performance improvement
    extern __shared__ float sharedData[];
    
    // Perform calculation if within bounds
    if (i < n)
    {
        sharedData[threadIdx.x] = a[i] * (1.0f + b[i] * p);
    }
    else
    {
        sharedData[threadIdx.x] = 0.0f; // Ensure all threads write to shared memory
    }
    __syncthreads();
    
    // Ensure all shared memory writes are completed
    if (i < n) 
    {
        result[i] = sharedData[threadIdx.x];
    }
}