#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to perform vector multiplication
__global__ void vec_mulMany(int n, int sizeKernel, double *result, double *x, double *kernel)
{
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds and perform multiplication
    if (id < n) {
        int id2 = id % sizeKernel; // Efficient modulo operation
        result[id] = x[id] * kernel[id2];
    }
}