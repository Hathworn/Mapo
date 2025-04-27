#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with shared memory for better performance
extern "C"
__global__ void squared(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n)
    {
        // Use shared memory for faster data access
        __shared__ float shared_a[256];
        shared_a[threadIdx.x] = a[i];
        __syncthreads();

        // Perform computation using shared memory
        result[i] = shared_a[threadIdx.x] * shared_a[threadIdx.x];
    }
}