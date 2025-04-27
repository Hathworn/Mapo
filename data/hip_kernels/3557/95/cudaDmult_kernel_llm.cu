#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDmult_kernel(unsigned int size, const double *x1, const double *x2, double *y)
{
    // Get the global index using blockIdx and threadIdx
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for faster access
    __shared__ double shared_x1[1024];
    __shared__ double shared_x2[1024];
    
    // Load data into shared memory if within bounds
    if (index < size) {
        shared_x1[threadIdx.x] = x1[index];
        shared_x2[threadIdx.x] = x2[index];
    }

    __syncthreads();

    // Perform multiplication using shared memory data
    if (index < size) {
        y[index] = shared_x1[threadIdx.x] * shared_x2[threadIdx.x];
    }
}