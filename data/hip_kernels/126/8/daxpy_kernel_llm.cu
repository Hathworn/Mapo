#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void daxpy_kernel(int n, double a, double * x, double * y)
{
    // Use shared memory for improved memory access pattern
    extern __shared__ double shared_x[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load x into shared memory
    if (i < n) {
        shared_x[threadIdx.x] = x[i];
        __syncthreads();
        
        // Perform computation
        y[i] = a * shared_x[threadIdx.x] + y[i];
    }
}