#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel with shared memory for better performance
extern "C"
__global__ void cuSqrt(int n, float *a, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster data access
    __shared__ float shared_data[256]; // Assumes 256 threads per block, adjust as needed
    if (i < n) {
        shared_data[threadIdx.x] = a[i];
        __syncthreads(); // Sync threads within block
        
        // Perform the square root operation
        result[i] = sqrt(shared_data[threadIdx.x]);
    }
}