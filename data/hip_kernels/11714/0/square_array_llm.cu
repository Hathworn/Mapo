#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for better performance
    __shared__ float shared_a[256];
    
    // Load data into shared memory if within bounds
    if (idx < N)
    {
        shared_a[threadIdx.x] = a[idx];

        // Synchronize threads to ensure all data is loaded before proceeding
        __syncthreads();

        // Perform computation using shared memory
        shared_a[threadIdx.x] *= shared_a[threadIdx.x];

        // Synchronize threads before writing back to global memory
        __syncthreads();

        // Write results back to global memory
        a[idx] = shared_a[threadIdx.x];
    }
}